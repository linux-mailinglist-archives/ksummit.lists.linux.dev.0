Return-Path: <ksummit+bounces-1010-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DBE77FA29
	for <lists@lfdr.de>; Thu, 17 Aug 2023 17:03:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75AFE1C21487
	for <lists@lfdr.de>; Thu, 17 Aug 2023 15:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2957C14F79;
	Thu, 17 Aug 2023 15:03:35 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1FDE568
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 15:03:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 951949D5;
	Thu, 17 Aug 2023 17:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692284535;
	bh=xLn/QRz9mBs0/hCSN2mHhPA7PPiBH2TBzejNz+XDLRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O/sJM1agaxphhjqTAlJIOiayHyt9++sqBZEbHNULTULLrHeewHidNcjoVFgkf5Iak
	 904/3JVmEqGYgDl5Ab4ExHwc5outNfcewnTXsYp6+Qc72dpaNxOGK2q2BHQttjzZ3v
	 gVuTyrQRXR380bb8WtlXjKSMxvg6F6eG8wtlhLK4=
Date: Thu, 17 Aug 2023 18:03:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230817150336.GJ21668@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com>
 <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
 <20230817124255.GI21668@pendragon.ideasonboard.com>
 <CANiq72m73vvbCLaRUkPVBfE6e+7FOYjBqd-EBJaLW-geukB2dA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m73vvbCLaRUkPVBfE6e+7FOYjBqd-EBJaLW-geukB2dA@mail.gmail.com>

On Thu, Aug 17, 2023 at 03:56:43PM +0200, Miguel Ojeda wrote:
> On Thu, Aug 17, 2023 at 2:42 PM Laurent Pinchart wrote:
> >
> > I think the rules will need to be somehow flexible. As Jani mentioned,
> > there's a genuine need to be able to discuss design questions before a
> > patch series reaches perfection (experienced developers will usually
> > know that they should mark their series as RFC in that case, but
> > newcomers may not have this tribal knowledge). On the other hand, I'm
> > not going to discuss the design behind a patch series if the code is
> > intended with 3 spaces and uses CamelCase.
> >
> > Reports from automated tests, or automated reviews, should be designed
> > to help the submitter, not to scold and discourage them. I'm pretty sure
> > we can come up with wording that will be nicer to read than what I would
> > write when being tired at 3:00am, repeating the same comment for the
> > 50th time.
> 
> I think the bot should simply reply commenting on the issues it has
> found, without judging whether the patch should or should not be
> reviewed (and the bot could perhaps explicitly say so to avoid
> submitters getting discouraged).
> 
> Then, depending on what the bot finds, i.e. the amount and kind of
> issues, reviewers can decide and reply as needed. RFC patches could be
> skipped by the bot.

This defeats a little bit the point of lowering the workload of
reviewers though, if they have to review each bot report and reply to it
manually :-)

> This would already save a ton of time for reviewers, and it would help
> new contributors understand the requirements.
> 
> However, a worry that I have about such a system is if people start to
> spam unprepared patches until they pass. If that becomes a problem,
> then a possible solution could be to have a staging list for that (or
> server or similar).

-- 
Regards,

Laurent Pinchart

