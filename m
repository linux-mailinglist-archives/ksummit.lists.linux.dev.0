Return-Path: <ksummit+bounces-1205-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5857E6988
	for <lists@lfdr.de>; Thu,  9 Nov 2023 12:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CC17281689
	for <lists@lfdr.de>; Thu,  9 Nov 2023 11:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F038619BB1;
	Thu,  9 Nov 2023 11:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kXivmtce"
X-Original-To: ksummit@lists.linux.dev
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDCF199D3
	for <ksummit@lists.linux.dev>; Thu,  9 Nov 2023 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4F540AE;
	Thu,  9 Nov 2023 12:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1699529312;
	bh=E3/x8jWAPx2oVwF93OVmslDIqwiOHlYzYuNWERHn/KE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kXivmtces+7rr0Hv6tunsSggaGfUtDTConoVYTPgCCWYwCBoAFcRBdjAtscj4bbEn
	 YW23OqQcaK41sm4RGsGvmXiC4T9FzRUGxQkgH9b29wFU0s3rIHzmL9OTKp4JKPgi1J
	 ZwsK64QH0570FvAMGu0M2gBRA7aBszyClqPklh4o=
Date: Thu, 9 Nov 2023 13:29:00 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Joe Perches <joe@perches.com>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: [workflows]RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231109112900.GH21616@pendragon.ideasonboard.com>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <20231106110547.6956a430@gandalf.local.home>
 <280f404dcaab5a1cee2cc67f829c1d85aa91d772.camel@perches.com>
 <ZUu68zEzrlDVenA1@finisterre.sirena.org.uk>
 <6737487f097401510c87f38239d2f75e22fca46d.camel@perches.com>
 <20231108140415.46f84baa@gandalf.local.home>
 <985f7533f6d6e28f78d695b34a24702c3dd4eb1c.camel@perches.com>
 <20231108143447.12d73140@gandalf.local.home>
 <ZUzAzl9I7h9bjMp0@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZUzAzl9I7h9bjMp0@finisterre.sirena.org.uk>

On Thu, Nov 09, 2023 at 11:21:50AM +0000, Mark Brown wrote:
> On Wed, Nov 08, 2023 at 02:34:47PM -0500, Steven Rostedt wrote:
> > Joe Perches <joe@perches.com> wrote:
> 
> > > > Right. For example, I use linux-trace-kernel@ to add patches to patchwork,
> > > > but I prefer the discussions to be done on LKML.  
> 
> > > How would that work?  Especially with get_maintainer?
> 
> > The way it works now. Just Cc both lists. What's the problem with that?
> 
> So that's just CC the list and then both the patch and discussion end up
> on both lists, which one you use is more of a personal thing with your
> workflow.
> 
> > TRACING
> > M:      Steven Rostedt <rostedt@goodmis.org>
> > M:      Masami Hiramatsu <mhiramat@kernel.org>
> > L:      linux-kernel@vger.kernel.org
> > L:      linux-trace-kernel@vger.kernel.org
> > S:      Maintained
> 
> That wouldn't be affected since it's an explicit thing in the entry for
> the subsystem - it's not being picked up by the wildcard entry or by 
> get_maintainers just automatically adding a CC to LKML to everything
> even without it being explicitly listed.

This would increase my trust in get_maintainer.pl, I would be less
likely to unconditionally remove LKML from the list it produces when I
send patches.

-- 
Regards,

Laurent Pinchart

