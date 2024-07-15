Return-Path: <ksummit+bounces-1420-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8C79317A7
	for <lists@lfdr.de>; Mon, 15 Jul 2024 17:32:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18ABB1C21D36
	for <lists@lfdr.de>; Mon, 15 Jul 2024 15:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C4BF9EC;
	Mon, 15 Jul 2024 15:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="QrwlkAgl";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="QrwlkAgl"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A68E18F2F9
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 15:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721057519; cv=none; b=hXdtMOM4hd4J59xVA4YdCdSsvwNS+a7ynOyEmiGUSLM1R4FlvPJxSxGqgQdiWZJzdFP6+icldxOjIqgmsV1i+2e/62+zMNzB78Nr2uXPOa3BHl0aKVlSZdF9w1itFjykBmoE0wMCdqxd/j/Td9ojypj5bB4TtQTRBZc+b8WGzRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721057519; c=relaxed/simple;
	bh=h2+m9TYShKHtlBVDLLyB9v9hzsYW1dYuynAe2bqrqrA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cluVxQclqRqzlECLDa7WA3RYZr6WhpBmdDiUmHjN4jmB4TD7g90XEY18th3vpL9iCLU/qLfMOUtDtq87KmJ0CfJEOPH7+zA6fkdSrYhoOlt5JFGVv+0HPdig5zMyG63qjv/uaN/0PMqQqj0Bvp4U7Efv9h8+AoSp7+nGyzrYps8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=QrwlkAgl; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=QrwlkAgl; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721057517;
	bh=h2+m9TYShKHtlBVDLLyB9v9hzsYW1dYuynAe2bqrqrA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=QrwlkAglXPVuJUkEcczANrVH98+igkiFnxr1wAtasqyG8HwVk41NtnVCOJ5Ar2l0U
	 OiLXgDr6Kjo8H4w7weSY8oyJDx0xk/YMrVs6IP6CwZDRU62z7+zd8qHmobjmvYCQSj
	 K2Anyv27bBSqmtFZGzKhLFwYmHVghI03EooDgWPk=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 50083128652B;
	Mon, 15 Jul 2024 11:31:57 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id c8jNq1gnbE0S; Mon, 15 Jul 2024 11:31:57 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1721057517;
	bh=h2+m9TYShKHtlBVDLLyB9v9hzsYW1dYuynAe2bqrqrA=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=QrwlkAglXPVuJUkEcczANrVH98+igkiFnxr1wAtasqyG8HwVk41NtnVCOJ5Ar2l0U
	 OiLXgDr6Kjo8H4w7weSY8oyJDx0xk/YMrVs6IP6CwZDRU62z7+zd8qHmobjmvYCQSj
	 K2Anyv27bBSqmtFZGzKhLFwYmHVghI03EooDgWPk=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 8218C1286472;
	Mon, 15 Jul 2024 11:31:56 -0400 (EDT)
Message-ID: <4a168ace6f0c3612bab636f3ab6043833e9691f6.camel@HansenPartnership.com>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Greg KH <gregkh@linuxfoundation.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Mimi Zohar
 <zohar@linux.ibm.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 ksummit@lists.linux.dev
Date: Mon, 15 Jul 2024 11:31:55 -0400
In-Reply-To: <ZpU-A9avLDktkFT_@sashalap>
References: <ZpQ0soWV6zIpgigf@sashalap>
	 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
	 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
	 <2024071528-cahoots-reacquire-9eab@gregkh>
	 <3a357a63f67f3e6aff5e6d020d40b51fa24e0280.camel@linux.ibm.com>
	 <ef31a7c7546ef232665760aac98c8d7f20060bcc.camel@linux.ibm.com>
	 <202407151434198c3715e9@mail.local>
	 <2024071515-zestfully-womankind-1901@gregkh>
	 <87h6cqya32.fsf@trenco.lwn.net>
	 <b71b6745ae79ae40196d82c0c306acdc174c0994.camel@HansenPartnership.com>
	 <ZpU-A9avLDktkFT_@sashalap>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 2024-07-15 at 11:19 -0400, Sasha Levin wrote:
> On Mon, Jul 15, 2024 at 11:07:30AM -0400, James Bottomley wrote:
> > On Mon, 2024-07-15 at 09:00 -0600, Jonathan Corbet wrote:
> > > Are developers and maintainers expected to put in stable tags the
> > > way they are expected to add Signed-off-by, or is it a fully
> > > optional practice? In the latter case, I'm not sure how much good
> > > messing with the tags will do.
> > 
> > So what's documented is
> > 
> > Fixes: is generally useful outside of stable (for bug tracing and
> > the like) and is thus not optional.  It simply means something
> > about the target was updated by the patch, but this could be
> > spelling in comments or white space and thus may not be a stable
> > candidate.
> 
> But then look at how folks interpert the Fixes tag:
> 
> On Sun, Jul 14, 2024 at 12:27:55PM -0700, Linus Torvalds wrote:
> > I would hope that *all* commits improve on something. And if it's
> > an actual fix to a previous commit, it should say so.
> > 
> > If it's just a random improvement, it shouldn't refer to a previous
> > commit at all.
> 
> Linus (and others) see the Fixes tag differently than how you (and
> others) see it.
> 
> Which, I guess, is the issue I'm trying to resolve.

Right.  We have clear(ish) text in 5.Posting.rst and stable-kernel-
rules.rst that supports the above, so I think the only outcome might be
making this more clear in the documentation and actually trying to
enforce it.

James


