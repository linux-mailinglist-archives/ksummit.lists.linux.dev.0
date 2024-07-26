Return-Path: <ksummit+bounces-1508-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A084093D7B0
	for <lists@lfdr.de>; Fri, 26 Jul 2024 19:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C47431C23179
	for <lists@lfdr.de>; Fri, 26 Jul 2024 17:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE5A17D352;
	Fri, 26 Jul 2024 17:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="EWl6/L1h"
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC57282EA
	for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 17:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722015220; cv=none; b=ASubskHt2dW21ej0mnR43ecZde8AsFJh9n2OSQTuUk0skN59I3Sn/8YfpylJXyhP8bhO1ASn96mhNAmAO4OuiQ8oHlItJmhn8wBaQ7uLk0ZS11GZ/u/OXPd2eC0O+fMh58fCnuzj/8QBKcXUP+KdSg/L9OlqSXbWlfo1RYWrY5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722015220; c=relaxed/simple;
	bh=e3N5bWu4r8Swl4BzWy7i9jr2amOi1C9JqeLg+IveS6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CB3JSCK97Qb2kkBTSFqXBFhvXQ1ZfT0gRfbW2k2yxHykoZA77/wfXGSz+jEaQJT6l+RguN/nEEVnGO2bIYko7bFBL/+RXWXx9J+1aayggSpc/GzPkNL873Lpmr1f3PiuKB76V3133JZezX67ytZ8kuDkZIuiNwpKJJVsv81X1kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=EWl6/L1h; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3684e2d0d8bso155569f8f.2
        for <ksummit@lists.linux.dev>; Fri, 26 Jul 2024 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1722015217; x=1722620017; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c/B7g0UHHGpKr5sLCW2cjeH3RTgEO1uT2YFJABG6Bsg=;
        b=EWl6/L1h1siL1WFi0Rs+fVdMyQn7Lia++T0xIephSr4rUt6mlEIxwzzdYYQExXjsGu
         Nd/dVbf8ZR2ElbAVMfg0hsRVnRvg4YWSEzTu0YLaHffD98PHmfv7nRfkLn+fyyrCiWtE
         uEprHuZ7TOLt1ChCjNrX5NJqaiLzIzr7lCP6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722015217; x=1722620017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/B7g0UHHGpKr5sLCW2cjeH3RTgEO1uT2YFJABG6Bsg=;
        b=WDLRKr1yNNi3PlEHaLPt8EwjiaBMXvU08854er+TdIWdW/az9b3yVrWqgyDWTi8Duw
         8+1ZfO1+Sobtp0ys9qLWOdyZkhQmzj5ZvURS/77addBvqKvm70zuSXrE5d0mq7Y1hr3l
         PHlIK2XbBwCJYe4pXriCFVbjYci1Xj+CEOBGOQ+U2WTlqrAh2c0t1eXyTQrV1A+fPJKp
         Zi/OhgvrzS8UZUVRGVEMVJJaP6SjuE2zu+Gm1md3C7SDALIHPHIYDUUXugDqZsputIvk
         w+YmDlgH8Mxmvbs+i0QgZ+z8qwnhl2gCiB3nRuHZfDcQ447AmA6XVTrWCOVpdUSAFYtC
         nn5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVx+O7mgISHjJMPXMBQl5F7eMAt2sfjkeARfignnSkWNDwQr49EDlMT1hxWF+oeutnLWOnj68A/@lists.linux.dev
X-Gm-Message-State: AOJu0YxESf5U7OYwC4CXJsXrkGxT2hcrxzAlCQnSK0M3EauVYRtNka51
	D74UjV7+t+jQHRiigQVA80trs1m4QnQuPieDdWMpFtYFRC5jbiIjEsks7f76gg8=
X-Google-Smtp-Source: AGHT+IG3ue2Wp3NAwG+80cC1hBEBaxqYkh1o6tYlzluNcJg5ps4z/XxOoMXpw4ib8InHKvN9IoLe0A==
X-Received: by 2002:a5d:59a2:0:b0:367:95e3:e4c6 with SMTP id ffacd0b85a97d-36b34cec909mr2845449f8f.1.1722015216751;
        Fri, 26 Jul 2024 10:33:36 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b36858179sm5684617f8f.88.2024.07.26.10.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 10:33:36 -0700 (PDT)
Date: Fri, 26 Jul 2024 19:33:34 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jiri Kosina <jikos@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>, ksummit@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org, jgg@nvidia.com
Subject: Re: [MAINTAINERS SUMMIT] Device Passthrough Considered Harmful?
Message-ID: <ZqPd7i22_oyPB2UN@phenom.ffwll.local>
References: <668c67a324609_ed99294c0@dwillia2-xfh.jf.intel.com.notmuch>
 <nycvar.YFH.7.76.2407231320210.11380@cbobk.fhfr.pm>
 <1e82a5c97e915144e01dd65575929c15bc0db397.camel@HansenPartnership.com>
 <20240724200012.GA23293@pendragon.ideasonboard.com>
 <a75782218f34ae3cff725cbcfb321527f6aa2e14.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a75782218f34ae3cff725cbcfb321527f6aa2e14.camel@HansenPartnership.com>
X-Operating-System: Linux phenom 6.9.7-amd64 

On Wed, Jul 24, 2024 at 04:37:21PM -0400, James Bottomley wrote:
> On Wed, 2024-07-24 at 23:00 +0300, Laurent Pinchart wrote:
> [...]
> > What I get from the discussions I've followed or partcipated in over
> > the years is that the main worry of free software communities is
> > being forced to use closed-source userspace components, whether that
> > would be to make the device usable at all, or to achieve decent level
> > of performance or full feature set. We've been through years of
> > mostly closed-source GPU support, of printer "windrivers", and quite
> > a few other horrors. The good news is that we've so far overcome lots
> > (most) of those challenges. Reverse engineering projects paid off,
> > and so did working hand-in-hand with industry actors in multiple ways
> > (both openly and behind the scenes). One could then legitimately ask
> > why we're still scared.
> 
> I don't think I am.  We're mostly fully capable of expounding at length
> on the business rationale for being open if the thing they're hiding
> isn't much of a differentiator anyway (or they're simply hiding it to
> try to retain some illusion of control), so we shouldn't have any fear
> of being able to make our case in language business people understand.
> 
> I also think this fear is partly a mindset problem on our part.  We
> came out of the real fight for openness and we do embrace things like a
> licence that forces open code (GPL) and symbols that discourage
> proprietary drivers (EXPORT_SYMBOL_GPL), so we've somewhat drunk the
> FSF coolaid that if we don't stand over manufacturers every second and
> force them they'll slide back to their old proprietary ways.  However,
> if you look at the entirely permissive ecosystem that grew up after we
> did (openstack, docker, kubernetes, etc.) they don't have any such fear
> and yet they still have large amounts of uncompelled openness and give
> back.

This matches my experience. Legal and technical roadblocks help a bit in
the margins, but they don't matter. The open gpu stack is 90% MIT, and
nvidia and all the others have demonstrated for years how easy it is to
ignore the GPL'ed part.

What gets vendors involved is a successful project that drives revenue,
where they have a clear need for a seat at the table to make sure the good
times for them continue. Clear rules what it takes to get that seat is in
my experience really the driving force for private discussions with
vendors, and from that pov the most important thing I've ever done for the
open gpu stack is this little documentation section:

https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

Unlike laws you can legalese around and code you can trick with hacks for
an endless game of whack-a-mole the above doc was the real stick. And it
absolutely needed the carrot of the successful project that financially
matters to work.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

