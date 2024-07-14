Return-Path: <ksummit+bounces-1405-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB5930C1A
	for <lists@lfdr.de>; Mon, 15 Jul 2024 01:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4D1F1F216EF
	for <lists@lfdr.de>; Sun, 14 Jul 2024 23:06:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483EE13A3F4;
	Sun, 14 Jul 2024 23:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Obop00Tk";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="Obop00Tk"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A8F1BDCD
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720998367; cv=none; b=XTrSH7I+0UWJW4Rah58RaD0n/bj4119ylyDADdyGTDoBFXgevhGKg7s5fsTMUYLKLfOlOgcQ9gFu7sMCTOhFFLr86sAWcT4MP/YctvEqcCU8vPuR+umDrheFy4lQopzU8dfOwt6JnKPFMcsjhJxQTE/zFdD39hy42jTbPSyyxso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720998367; c=relaxed/simple;
	bh=sQzE7F+gjGh6ZDE7YiLLZTjdDL/cVxrzyE66bdGEqXs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JDVlACF6V2AO2nzbDnUZlj9H2p9UPFFcZ2AFvOfyOixliBuhWXcZ0/fIB8FzGtcbG4BkZ0NSPZFKPQoXnuiFmhzLg18LEAfDVbSCXM0DZSDbMylQt+xphYNfLjnbxn/sVCymTx7vSwaZZflARyAjDd01K6nTSOI+97b9z1xafdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=Obop00Tk; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=Obop00Tk; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1720998360;
	bh=sQzE7F+gjGh6ZDE7YiLLZTjdDL/cVxrzyE66bdGEqXs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Obop00TkJDsTPDzjMMvzjcVgeMy2eH7tU5nsJAehAj9uZ6PU9X/fHwNyZoI20VUVx
	 e1jDYeYRffoIVVnYf8FXpE4NkWvXEmleBZYXGcMu0wDSgduD8ZX3xN4NW4JOKhCwFS
	 ON1/AscQxUNTi2aJA7KysST5ikS97sHDK8xydhXg=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C85EE1281042;
	Sun, 14 Jul 2024 19:06:00 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 4RDfBdIUYB22; Sun, 14 Jul 2024 19:06:00 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1720998360;
	bh=sQzE7F+gjGh6ZDE7YiLLZTjdDL/cVxrzyE66bdGEqXs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=Obop00TkJDsTPDzjMMvzjcVgeMy2eH7tU5nsJAehAj9uZ6PU9X/fHwNyZoI20VUVx
	 e1jDYeYRffoIVVnYf8FXpE4NkWvXEmleBZYXGcMu0wDSgduD8ZX3xN4NW4JOKhCwFS
	 ON1/AscQxUNTi2aJA7KysST5ikS97sHDK8xydhXg=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 1C47F1280F16;
	Sun, 14 Jul 2024 19:06:00 -0400 (EDT)
Message-ID: <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Sasha Levin <sashal@kernel.org>, Linus Torvalds
	 <torvalds@linux-foundation.org>
Cc: ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 14 Jul 2024 19:05:58 -0400
In-Reply-To: <ZpQ0soWV6zIpgigf@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
	 <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
	 <ZpQdJpKhIzmf3veU@sashalap>
	 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
	 <ZpQ0soWV6zIpgigf@sashalap>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Sun, 2024-07-14 at 16:27 -0400, Sasha Levin wrote:
> On Sun, Jul 14, 2024 at 12:27:55PM -0700, Linus Torvalds wrote:
[...]
> > I would hope that *all* commits improve on something. And if it's
> > an actual fix to a previous commit, it should say so.
> > 
> > If it's just a random improvement, it shouldn't refer to a previous
> > commit at all.
> 
> This is *one* view. I've observed that both individuals and companies
> started requiring a fixes tag unless they're writing a new feature.
> 
> Heck, back in Google you couldn't commit anything that is not a new
> feature unless the commit message had a "Fixes:" tag to make the bot
> happy.

But we know how to enforce a unified view of process: we document it in
Documentaion/process ... and indeed we already have a handling-
regressions.rst which says:

    * Add a "Fixes:" tag to specify the commit causing the regression.
   
    * If the culprit was merged in an earlier development cycle,
   explicitly mark the fix for backporting using the ``Cc:
   stable@vger.kernel.org`` tag.

That doesn't seem ambiguous or unclear, why can't we just follow it? 
It does everything you want: distinguished patches that should be
backported from fixes that probably don't matter for backporting.
> 
> > What you seem to want is some made-up distinction between "fix that
> > wants backporting" and "fix that is not important for backporting".
> > 
> > We have long been told that commits that have a "Fixes" tag don't
> > need a "Cc: stable" because the stabl;e people already pick up on
> > the fixes, so now you're complaining about the lack of stable
> > tagging.
> 
> Who? Where?

I think the problem is there is a central document, saying what this
all means, but you're not pointing to it which means everyone has a
slightly different view because they haven't read it.  Let's just start
with pointing everyone to handling-regressions.rst and see if we get
better consistency before trying to invent new processes that give
everyone even more leeway to do things differently.

> This ended up happening because we couldn't get folks to consistently
> add stable tags, so we've started pulling in more patches with just a
> Fixes tag (and then introducing AUTOSEL for commits without a stable
> tag).
> 
> I was looking to get away from that, as some maintainers would assume
> what you did, and some would assume the exact opposite. I kept ending
> up with people angry at me no matter which choice I'd make around the
> Fixes tag policy.

But there doesn't seem to be an ambiguity: just point to the documents
and say "do that" (or "don't do that" if they deviate).

> If you think that anything with a Fixes tag should land in stable,
> then great, we can change the formal policy and get it over with.

Let's just start with trying to get everyone to unify around what's
already written.

Regards,

James




