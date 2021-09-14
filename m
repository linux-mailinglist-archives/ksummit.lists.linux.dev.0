Return-Path: <ksummit+bounces-565-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E191940AF3B
	for <lists@lfdr.de>; Tue, 14 Sep 2021 15:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id B813B1C0A47
	for <lists@lfdr.de>; Tue, 14 Sep 2021 13:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB61E3FD9;
	Tue, 14 Sep 2021 13:39:57 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from sipsolutions.net (s3.sipsolutions.net [144.76.43.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1072C3FC3
	for <ksummit@lists.linux.dev>; Tue, 14 Sep 2021 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=YE5S9gSHyfxp99FL/6mq2aM8kO293bPxI6xNMfwx6DY=;
	t=1631626796; x=1632836396; b=HSIRZo+GH7Nm6p+FJdxvfnIHikuATFfJsL+ZDD/N5xyigPP
	mXQjwfS0nUZU3RU2d8Q7DrlA3v4zb3wP4BjxfFYT2jz8AO7TuDXtIRH23J2fLupmpDthAS0YVCf1R
	WefEPoK5oOqRGiq1pp3NHgkeD4VgQr0oCJRXTvbtT3OfvvDCU+vs0uLrPZLp4l4owAKpoRc5KaPjL
	w29mCJau43IfOuFFIDF8jYnKpzrCtxO1xUiuo98odvWgNIeLflXp8Q/FtV+ECLC/2WMO1JWRHQJA6
	Y41PV8C5pTkXvAiUHBN9ebhAC8tIGex3TbA8oQ1h7jMZlEe1AZGxGE+UUfegL2Bg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95-RC2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1mQ8OL-006rj4-HR;
	Tue, 14 Sep 2021 15:22:29 +0200
Message-ID: <89c05f467348efc0c82060be11ae517ba44a1eac.camel@sipsolutions.net>
Subject: Re: [MAINTAINER SUMMIT] User-space requirements for accelerator
 drivers
From: Johannes Berg <johannes@sipsolutions.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, James Bottomley
	 <James.Bottomley@HansenPartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, ksummit@lists.linux.dev
Date: Tue, 14 Sep 2021 15:22:28 +0200
In-Reply-To: <YT0lDyMMSRSmhD95@pendragon.ideasonboard.com>
References: <877dfop2lx.fsf@meer.lwn.net>
	 <9f380f6b8efecb4bfe39a3d520ff74d8ab07b9c5.camel@HansenPartnership.com>
	 <YTvVKrfyMc7fKsZx@piout.net>
	 <05c1591b0e3744233e78ae35ba66d2721ee6af5e.camel@HansenPartnership.com>
	 <87y283np2i.fsf@meer.lwn.net>
	 <9bbe54192d9b4807422941bccfd2f0e48a5525ff.camel@HansenPartnership.com>
	 <YT0lDyMMSRSmhD95@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-malware-bazaar: not-scanned

On Sun, 2021-09-12 at 00:52 +0300, Laurent Pinchart wrote:
> 
> For a wireless driver the situation is possibly different, I suppose
> that if the closed-source userspace blob is there only for regulatory
> reasons, then there would be very little point in having a closed-source
> implementation with a parallel one.
> 
For the record, I know of no such thing, certainly not with an upstream
driver.

Regulatory enforcement is either done through regulatory.db{,.p7s}
loaded into the kernel (the accepted keys are determined at build time),
or, in many newer devices, by firmware.

johannes


