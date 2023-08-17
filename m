Return-Path: <ksummit+bounces-1005-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE1777F690
	for <lists@lfdr.de>; Thu, 17 Aug 2023 14:43:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4519A281EF2
	for <lists@lfdr.de>; Thu, 17 Aug 2023 12:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8034134D3;
	Thu, 17 Aug 2023 12:42:53 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C7912B7D
	for <ksummit@lists.linux.dev>; Thu, 17 Aug 2023 12:42:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76080283;
	Thu, 17 Aug 2023 14:41:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1692276095;
	bh=nKRYcOY5VHb6IO2hR9J7uLJEU6umPuhamo6O6kwTc7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQYCHxtp0TzVKiUXB000trfOzkUmZUEMiFobNb34TmknqmwWlcBepmegjZSwKFT72
	 HyCpyDhEs1+xzZcC7kcR0qGI99D9N61SMBmcq1bRBHAe7X+8H8q4uv9yssN5PtdfQI
	 SdtCCb2Lvu9QducTdS6FS9aCqjCToBhoFXygl0QU=
Date: Thu, 17 Aug 2023 15:42:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Jani Nikula <jani.nikula@intel.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>, ksummit@lists.linux.dev,
	Jeff Layton <jlayton@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [MAINTAINERS SUMMIT] Maintainer burnout
Message-ID: <20230817124255.GI21668@pendragon.ideasonboard.com>
References: <20230816180808.GB2919664@perftesting>
 <ZN0uNrpD8JUtihQE@bombadil.infradead.org>
 <87ttsx98ue.fsf@intel.com>
 <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7915398-b59a-4c9c-97c1-669be7471ec2@sirena.org.uk>

On Thu, Aug 17, 2023 at 01:17:39PM +0100, Mark Brown wrote:
> On Thu, Aug 17, 2023 at 03:00:57PM +0300, Jani Nikula wrote:
> > On Wed, 16 Aug 2023, Luis Chamberlain wrote:
> 
> > > In so far as making it possible to get b) to help, my current excitement
> > > surrounds around what Song Liu mentioned to me at LSFMM and then
> > > quickly demonstrated that the eBPF folks are doing with patchwork.
> > > Get the patches to be tested automatically, and *immediately*
> > > patch reviewers and maintainers can get feedback if something is not even
> > > worth reviewing.
> 
> > I'm all for automated testing and CI, and all i915 patches get tested
> > before merging. But requiring everything to pass before a human so much
> > as looks at it can be incredibly demotivating for contributors. For
> > example, if they polish the contribution, and take all corner cases into
> > consideration to pass the tests... and then get told their design is all
> > wrong and needs to be redone from scratch. It's a balance.
> 
> Indeed, and you're relying on your test automation being robust, the
> results being available promptly and the results being comprehensible if
> people can't readily run the tests themselves.  That said I read the
> above as more providing results so people can look at them rather than
> gating looking at things (eg, if everything is failing it's probably
> fine to not bother) - that seems a lot more reasonable.

I think the rules will need to be somehow flexible. As Jani mentioned,
there's a genuine need to be able to discuss design questions before a
patch series reaches perfection (experienced developers will usually
know that they should mark their series as RFC in that case, but
newcomers may not have this tribal knowledge). On the other hand, I'm
not going to discuss the design behind a patch series if the code is
intended with 3 spaces and uses CamelCase.

Reports from automated tests, or automated reviews, should be designed
to help the submitter, not to scold and discourage them. I'm pretty sure
we can come up with wording that will be nicer to read than what I would
write when being tired at 3:00am, repeating the same comment for the
50th time.

-- 
Regards,

Laurent Pinchart

