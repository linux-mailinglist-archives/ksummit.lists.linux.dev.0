Return-Path: <ksummit+bounces-1363-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE3D91959E
	for <lists@lfdr.de>; Wed, 26 Jun 2024 21:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26401B240AD
	for <lists@lfdr.de>; Wed, 26 Jun 2024 19:06:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A4219067B;
	Wed, 26 Jun 2024 19:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="aKzpT0AU";
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="aKzpT0AU"
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1643614F134
	for <ksummit@lists.linux.dev>; Wed, 26 Jun 2024 19:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.44.175.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719428765; cv=none; b=IRyezOf8NYvaVznhteWhEGBYi7o+z74vHWL0DNMtxM7AXnKTbXHT+SbXb6IuKzodCQoJzStWFVJtE8jfbP2sP0RobmTta/9s8+zE9TIlX10eIjxSPmun5aPS+ruMyF+GuRzb6haxMVKfqF+H0gOlhIKGk060dr/qBYhYleXtZxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719428765; c=relaxed/simple;
	bh=DK6jsm5jOCBCyIZ5OvpFcpBDWf9GWRM/7fd2yAyt+iQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dMnCKshsGiWBx6F3S8tWbytImpNEGztHo8Cwzy+9xie89kP9/xsN0ECH2VCwR4mZBfFQjdWL43wItmvuSCGDNASX88XIpaPvbrlpwdf+sWJ58+4vmfi+q3O888kXqzzQ8Xn5wDzE8zdqbnk0cOwLkJkgQOGRHYwIoMaJf0zJtKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=aKzpT0AU; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=aKzpT0AU; arc=none smtp.client-ip=96.44.175.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1719428762;
	bh=DK6jsm5jOCBCyIZ5OvpFcpBDWf9GWRM/7fd2yAyt+iQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=aKzpT0AU/YolDGwimEjuksmkigVKWObesxQCWFJjfjwst5BGQZkt25KxXMIPrMfjw
	 GjH2XqVy5pAcRQAK/liJjKrFPhAWFAkz2yJnnG7lrk3DkrPCEvFFYehakHNvXLDuBR
	 auyxb+lyDOB4kivevyeseEtoqxdfvU2ICuRp+YZI=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3910F12868CE;
	Wed, 26 Jun 2024 15:06:02 -0400 (EDT)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id 8BQCNvr99trg; Wed, 26 Jun 2024 15:06:02 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1719428762;
	bh=DK6jsm5jOCBCyIZ5OvpFcpBDWf9GWRM/7fd2yAyt+iQ=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=aKzpT0AU/YolDGwimEjuksmkigVKWObesxQCWFJjfjwst5BGQZkt25KxXMIPrMfjw
	 GjH2XqVy5pAcRQAK/liJjKrFPhAWFAkz2yJnnG7lrk3DkrPCEvFFYehakHNvXLDuBR
	 auyxb+lyDOB4kivevyeseEtoqxdfvU2ICuRp+YZI=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4302:c21::a774])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6788712868A3;
	Wed, 26 Jun 2024 15:06:01 -0400 (EDT)
Message-ID: <e7fc344ab85905abd46dfd2e2c7739a4f7f9d602.camel@HansenPartnership.com>
Subject: Re: [MAINTAINERS SUMMIT] [0/4] Common scenario for four proposals
 regarding regressions
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Steven Rostedt <rostedt@goodmis.org>, Greg KH
 <gregkh@linuxfoundation.org>
Cc: Mark Brown <broonie@kernel.org>, Thorsten Leemhuis
 <linux@leemhuis.info>,  ksummit@lists.linux.dev, Sasha Levin
 <sashal@kernel.org>
Date: Wed, 26 Jun 2024 15:05:59 -0400
In-Reply-To: <20240626143230.192ebcdf@rorschach.local.home>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
	 <54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com>
	 <c4db6faa-89ac-4f1c-ac87-1db8f91ac480@leemhuis.info>
	 <ead819d8bc59bd188bf4c07b3604a4aa5a194d8d.camel@HansenPartnership.com>
	 <c3071fa8-e64a-40a6-a725-4be1c668346f@sirena.org.uk>
	 <d1b85ab5a4363457eef65096c7c1d0efe28b5e41.camel@HansenPartnership.com>
	 <710867cc-fcc1-42e4-8946-34448a784afa@sirena.org.uk>
	 <32489d2e9b88f0353e97f28bf1d8018aa7dd4265.camel@HansenPartnership.com>
	 <20240625175131.672d14a4@rorschach.local.home>
	 <2024062651-skyward-stowaway-6ea6@gregkh>
	 <20240626143230.192ebcdf@rorschach.local.home>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2024-06-26 at 14:32 -0400, Steven Rostedt wrote:
> On Wed, 26 Jun 2024 09:36:22 +0200
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > > I'm curious. Is there a stable branch that adds the stable
> > > patches in continuously? That is, during the merge window, to
> > > have a branch that adds the stable patches as they come in and
> > > then when the merge window closes, to post the rc series with all
> > > the patches that have landed in that branch?  
> > 
> > Yes, it's in the stable-queue git tree.  And in the linux-stable-rc
> > tree for those that can not consume quilt trees.  Been there for
> > years...
> > 
> 
> Perhaps we should be encouraging people to download the linux-stable-
> rc and start testing that more?

Well, that was a note in the original top post of this thread (second
paragraph from the bottom):

https://lore.kernel.org/all/54f26c0959f796c52f04da9e831899f6482686ac.camel@HansenPartnership.com/

> Just because it's been there for years, doesn't mean people are aware
> of it.

The observation I made that no-one challenged is that no-one really
tests stable-rc trees.  I also asked if we should promote it more, but
I really think stable itself is good enough and it would only cause
confusion if we promoted an additional less stable stable tree.

James


