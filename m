Return-Path: <ksummit+bounces-1248-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C3F907470
	for <lists@lfdr.de>; Thu, 13 Jun 2024 15:57:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 489B71F24435
	for <lists@lfdr.de>; Thu, 13 Jun 2024 13:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A324D143C46;
	Thu, 13 Jun 2024 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="bgb4sohv";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="bgb4sohv"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5C4A0F
	for <ksummit@lists.linux.dev>; Thu, 13 Jun 2024 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718287024; cv=none; b=J0wCECFhtazDY2nFAUNEs/lt5lqgSxbY73dnPwiiC/98mIAxTjtlEE0zGSNiaqqPnos5tjz5TEpsK8LXAk7anpTVbf8VnuM87YdjEsc0jfqppBcgAKNowoMr0QBspwXYY0YFhyCcP/tvwjhrDIjJw17Lzz4WK1rE6jxA/ASGjQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718287024; c=relaxed/simple;
	bh=xRICW9jPEXxs7dudX/c2nKnBNkqh6hb4izOQSh35SYk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lNYYyZlXHlFci7VaJxgaU8sLfZgqPmtO1Is6dLgO1Tj0rMCLoo7W7Wu0U2wiMv1+punCGcNaXSFyc5DYYVVC+ASCn1SaTaplb46t6sEGF2fSmIycp9ayBceZhQ4vKz2aCeYKP/breeEkNn0aS/EdxJSQSEv0zOe7hKAiQQqOKLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=bgb4sohv; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=bgb4sohv; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718287021;
	bh=xRICW9jPEXxs7dudX/c2nKnBNkqh6hb4izOQSh35SYk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=bgb4sohvK2/49mueC40cQVqDm8cVA8LyFQnLqn0cwL/Wyo828k1P2Fe2fNWtkKRyU
	 lxUDh5avjbCHdH/X67B80D27heD2xjF/XlUhA6pP8AbBi366cq4WqAQfeMw6mBVykn
	 854ZC5Vy9iHGm9ZQrXkC85RItM9t1pCri+6l4QLo=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id B5E4D1286673;
	Thu, 13 Jun 2024 09:57:01 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 7R4o_yBifSzt; Thu, 13 Jun 2024 09:57:01 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1718287021;
	bh=xRICW9jPEXxs7dudX/c2nKnBNkqh6hb4izOQSh35SYk=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=bgb4sohvK2/49mueC40cQVqDm8cVA8LyFQnLqn0cwL/Wyo828k1P2Fe2fNWtkKRyU
	 lxUDh5avjbCHdH/X67B80D27heD2xjF/XlUhA6pP8AbBi366cq4WqAQfeMw6mBVykn
	 854ZC5Vy9iHGm9ZQrXkC85RItM9t1pCri+6l4QLo=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 03FE01286530;
	Thu, 13 Jun 2024 09:57:00 -0400 (EDT)
Message-ID: <dea93a79fc457d8a5424a18f8c138a4f75def064.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev"
	 <ksummit@lists.linux.dev>
Date: Thu, 13 Jun 2024 09:56:56 -0400
In-Reply-To: <ZmruqWDTG2PK-rbu@sashalap>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
	 <7794a2b09ae4fa73ac35fdaec4858145a665efea.camel@HansenPartnership.com>
	 <ZmruqWDTG2PK-rbu@sashalap>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 2024-06-13 at 09:06 -0400, Sasha Levin wrote:
> On Thu, Jun 13, 2024 at 07:58:58AM -0400, James Bottomley wrote:
> > On Thu, 2024-06-13 at 10:42 +0200, Thorsten Leemhuis wrote:
> > > The scenario shown at the start of the thread illustrates a
> > > problem I see frequently: commits with a Fixes: tag end up in new
> > > to stable series releases just days after being mainlined and
> > > cause regressions -- just like they do in mainline, which just
> > > was not known yet at the time of backporting. This happens
> > > extremely often right after merge windows when huge piles of
> > > changes are backported to the stable trees each cycle shortly
> > > after -rc1 is out (which even some kernel developers apparently
> > > are somewhat afraid to test from what I've
> > > seen).
> > 
> > I haven't really observed this for curated fixes.  For most
> > subsystems, patches with Fixes tags that are cc'd to stable tend to
> > go steadily outside the merge window.  Obviously a few arrive
> > within it, but usually at roughly the rate they arrive outside it.
> > 
> > What I observe in the merge window is huge piles of patches go into
> > stable *without* a cc:stable tag from the autosel machinery (and
> > quite a few even without fixes: tags).
> 
> Could you provide a concrete example? This shouldn't happen.

This one has no fixes or cc stable:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=37f1663c91934f664fb850306708094a324c227c

Yet here it is backported:

Message-id: 20240603121056.1837607-1-sashal@kernel.org

(I can't give a lore reference because conveniently it was a personal
cc with no tracked mailing list).

I picked that one because we discovered a bug with the strlcpy to
strscpy conversions in SCSI which it looks like this backport has.

> > So this does beg a couple of questions:
> > 
> > Since you have the figures, what's the proportion of regressions
> > caused by backports to stable without cc:stable tags?
> 
> This question came up two years ago and we had statistics around
> this. Autosel patches didn't cause more (actually, it was *less*)
> regressions than stable tagged ones.

OK, so Thorsten's stats should bear this out then ...

> > Could we fix a lot of this by delaying autosel?  It tends to ramp
> > up in the merge window when everyone is concentrating on other
> > things, so any regressions it causes naturally get ignored for a
> > couple of weeks.
> 
> autosel is currently delayed about 3-4 weeks, sometimes more.

That's fairly recent then.  When I look at 6.8 autosel began its flood
pretty much the moment the first SCSI pull request went in to the merge
window.  Checking 6.9 it seems to be about 10 days after ... has that
made a difference, or is it too early to tell?

James


