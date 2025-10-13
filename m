Return-Path: <ksummit+bounces-2512-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7EBBD64DB
	for <lists@lfdr.de>; Mon, 13 Oct 2025 22:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A83F4EFECE
	for <lists@lfdr.de>; Mon, 13 Oct 2025 20:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAE22EBDC7;
	Mon, 13 Oct 2025 20:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E1wng5Ly"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C64E2EDD76
	for <ksummit@lists.linux.dev>; Mon, 13 Oct 2025 20:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760389151; cv=none; b=NpIg+A/bQc34m9vbVGZ7PaZBA15sTwm+l7AJfDyCf5hhmDAdvCWNkcxaNVMz5G9ysKwKpwc2qpI6AgKsgibGP79LfYXfXsB9zELay+0S5x53uuNNZoVX06A2GAXpMBREb+hzGMmylSOWzKifMii3FTimfTMYM1EnccI5X2+ad8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760389151; c=relaxed/simple;
	bh=WRb+Pql2nfjeMPH2ZpXpYce3tuslvMCYLkqQIm8dgew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYJqYxm+5aFHdQlRs2lDcF+pxS9vpTQwgSqWEmQWjOfFGjmOXtLm5SpVraZzV3V0STX6Re/Z935cIFnBLtSLg8l7E4A5G8mhZgETDj5N7rhtMCcihc+QGEjMNwdRaj+VXS8+6cqX5XAoGsgyiVj23NLDx6+t5gE9brJdudz1Ojc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E1wng5Ly; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-166-19.bb.dnainternet.fi [82.203.166.19])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 19E96169;
	Mon, 13 Oct 2025 22:57:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760389046;
	bh=WRb+Pql2nfjeMPH2ZpXpYce3tuslvMCYLkqQIm8dgew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E1wng5LyoZZHE08Z2DO9foMDYwjYONkXrTSBrfU7XYGAZ9hT2jydt2oKHEdr3uLHA
	 TSL/ZFWcOM9CSZimOS+GlyUVJYMbKecNnALALWl1Zz8CmohbroX9p0hA3FcNrEmJkl
	 D/nqagBv76HO8YqMjo65cdVuNpAc/OH0t1AWz87o=
Date: Mon, 13 Oct 2025 23:58:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
	Steven Rostedt <rostedt@goodmis.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
Message-ID: <20251013205857.GA28892@pendragon.ideasonboard.com>
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <c86ba3c682251154ec554f39004c392f8b8e1c02.camel@HansenPartnership.com>
 <20251013133913.015f253b@gandalf.local.home>
 <20251013175031.GJ354523@mit.edu>
 <7EE2713D-7612-4EAC-9E4E-225A92FEC9D3@zytor.com>
 <CAHk-=wj8mfMkkLFXdMLyAzUPRH-m1h=+uJrJFSxQSRuRxbi-iw@mail.gmail.com>
 <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UjA8+pZoXMh9WgCHZAUX=pd7ehWxuu9kTFr5Dp5O-rCQ@mail.gmail.com>

On Mon, Oct 13, 2025 at 01:34:05PM -0700, Doug Anderson wrote:
> On Mon, Oct 13, 2025 at 12:20 PM Linus Torvalds wrote:
> > On Mon, 13 Oct 2025 at 12:07, H. Peter Anvin wrote:
> > >
> > > This was the *original* definition that I proposed, which was vetoed by Linus because it didn't provide a clickable experience.
> >
> > Yeah., I still don't believe that Message-ID is any better than a link.
> >
> > And the only believable argument *for* this all is the "one-click experience".
> >
> > Because I still believe that "if you use tools, then 'b4 dig' is
> > better than *any* pointless tag that just is entirely redundant and
> > only cuts down on the available information".
> >
> > So the one-click argument actually resonates with me, even if that is
> > very obviously not the workflow I use. At least I *understand* that
> > argument.
> >
> > All the other arguments seem just disingenuous in that they literally
> > give less useful information than "b4 dig" does.
> 
> Wow, I hadn't heard of "b4 dig" and it doesn't appear to have landed
> yet. ...but I searched and it was easy to find a reference. I'll check
> it out. Oh, it's using AI. I guess my suggestion that we should use AI
> to solve this problem was more on point than I realized. ;-) ;-) ;-)
> 
> OK, I found Sasha's RFC [1].

I think the one discussed in this mail thread is the implementation from
Konstantin, available from
https://git.kernel.org/pub/scm/utils/b4/b4.git/.

> The first thing I note is that "b4 dig" takes a Message-Id as an
> argument. So now I'm confused. I must be misunderstanding the problem
> we're trying to solve with the "Link:" tag?!
> 
> From how I've used it, the "Link" tag allows you to start with a
> commit hash in Linux and then go from there to a mailing list post
> (and/or Message-Id). ...and then it was suggested that we don't need a
> "Link" tag (or anything containing "Message-Id") because "b4 dig"
> solves the problem. ...but then "b4 dig" needs a Message-Id to work?
> Eh?
> 
> [1] https://lore.kernel.org/all/20250909163214.3241191-1-sashal@kernel.org/

-- 
Regards,

Laurent Pinchart

