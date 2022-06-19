Return-Path: <ksummit+bounces-660-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D905A550999
	for <lists@lfdr.de>; Sun, 19 Jun 2022 12:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21BB3280A8C
	for <lists@lfdr.de>; Sun, 19 Jun 2022 10:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F93D630;
	Sun, 19 Jun 2022 10:04:25 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197027B
	for <ksummit@lists.linux.dev>; Sun, 19 Jun 2022 10:04:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09006929;
	Sun, 19 Jun 2022 12:04:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1655633055;
	bh=EyPS6YQJ74adexbiMqAj0h0F6PEGZP11C/H0XvNsBts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AqiRvTZLiJmwncNIessZGx9JPTUkCPy3LIiSms1SsAendpkbVHPaU/LljLI+0Xq9r
	 kFdjJpScrp24KzdesA4DSBg/ugZtN9l22j+ywu31SlMN4RgAYV13MDJdiMyHxxWDib
	 7wvAPBL3beKGhPT5jXTzdMhsdsY5X4sr9zmL6IcU=
Date: Sun, 19 Jun 2022 13:04:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christoph Hellwig <hch@infradead.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	ksummit <ksummit-discuss@lists.linuxfoundation.org>,
	ksummit@lists.linux.dev
Subject: Re: [TECH TOPIC] Rust
Message-ID: <Yq70keAYGQQmyJLm@pendragon.ideasonboard.com>
References: <CANiq72nNKvFqQs9Euy=_McfcHf0-dC_oPB3r8ZJii2L3sfVjaw@mail.gmail.com>
 <Yq44nyu7P1uhBVGi@pendragon.ideasonboard.com>
 <Yq6+p+aRCjeZ7QsS@infradead.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yq6+p+aRCjeZ7QsS@infradead.org>

On Sat, Jun 18, 2022 at 11:13:59PM -0700, Christoph Hellwig wrote:
> On Sat, Jun 18, 2022 at 11:42:07PM +0300, Laurent Pinchart wrote:
> > All previous topics but this one are technical. To restore the balance a
> > bit (and also because I believe it's important to the success of this
> > project :-)), I'd like to also discuss the impact on the kernel
> > maintenance at large, beyond just the maintainers who opt in to be early
> > adopters of rust in their subsystem.
> 
> Yes.  That is I think the most important point.
> 
> I've played around with rust a bit for userspace project, and there is
> things I like a lot like strict type safety and the ownership model, and
> things I detest like verbose and unlogic syntax, the cargo cult of
> vendoring libraries instead of a sane shared library and versioning
> model (althought that should be largerly irrelevant for the kernel),
> and compared to many other languages it seems overall rather sane.
> 
> But I'm really worried about the impact on the kernel, as interface
> between languages are a real pain, and so far I'm not convinced at
> all that this pain is worth the gain, even if that could change in
> the future.

One point I'd like to explicitly address, as it seems to be very
relevant to me when it comes to whether or not the pain is worth the
gain, is how we'll deal with the fact that the rust compiler will tell a
non-negligible [*] part of the kernel developers that they don't have
the skills to write kernel code. Will we have a credible option to offer
there to help people improve their skills set, and how will we deal with
the fact that some people will be left on the side of the road ? Or
would we acknowledge what may be the elephant in the room that this
would actually be a good thing for the kernel code quality ? What about
the impact on a community that is already overworked and prone to
burn-out ?

[*] I have no way to quantify this at the moment, maybe I'm overly
pessimistic, and the number will likely vary depending on areas,
probably impacting BSPs differently than mainline.

> It doesn't help that the showcase seems to be binder,
> code that should have been in userspace from the start.
> 
> Btw, a lot of these aspects also apply to the whole drivers in eBPF
> discussion.

-- 
Regards,

Laurent Pinchart

