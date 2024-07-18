Return-Path: <ksummit+bounces-1446-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA959350BA
	for <lists@lfdr.de>; Thu, 18 Jul 2024 18:36:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43C8BB20901
	for <lists@lfdr.de>; Thu, 18 Jul 2024 16:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E411144D11;
	Thu, 18 Jul 2024 16:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R+Y05ufw"
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455B713FD83
	for <ksummit@lists.linux.dev>; Thu, 18 Jul 2024 16:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721320605; cv=none; b=F5IYsQT6nnilpA1zMYs37ftpAuGH1HIjn/C65gci7TFWnbv9emezRrZeWH474WmEiiVv41UYJ7XNk/JZQzSSKiUvdHqqoDeRVxgzQesEJ8g0UGVjC9Pa8LV03cVcT9nglHSv9H4bztYRWZKEUwh0+yHhUyo3yTddfA15R2L1lk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721320605; c=relaxed/simple;
	bh=biAH2iynPLiw0Hhtn3Ezli3RvWm8RcdrneB3yU9G7jI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3iHB5jZbV3oZHWjSbBdzdsQzrY4yp6ZJFTdYQcDE3oJzI5MCPdNorCzLHkgRIkeEJoTA3hd3RMTcXWob7iu8lDNofugKvRwiWrlCffvHvOLZb10+nEHhwacn93LLUylZY5y7+k7wyac9YNz6K+OVPsZoulB8c4id3z+9zSVrgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R+Y05ufw; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-250ca14422aso538011fac.0
        for <ksummit@lists.linux.dev>; Thu, 18 Jul 2024 09:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721320603; x=1721925403; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yp8/fLygD9U9tIxzfcHMZD+F9R40NCV7rxcXjPvPL8Q=;
        b=R+Y05ufw7Zyqt+rWQ17g/kM2GgEP6Shxe/Bkd8nZeFx7VogMrsUI7p//WT3OwyVVvf
         g2AGPUXscWRLFDk1oZVeNCUG04xre8odMwNPFdcnsUeju6dNwNpbUS/4Q0S8VWLxzj54
         DNiZcp0W+IubcYBFmIrolr371yJLquYTwtv7AQpSzPew9nou9756w2GF7eBPI5th2r5t
         v/xopk0fUD6D4hfGs+u3qmR4bY9KQKPvE3kJsL7uuYU8tr4oQR+rMGBibf2n8sQc0DQ5
         AjE2+vIA65ZONeaU2jnF1RDMGjWrbvargpmiB9hRmL8zRpue38WsKVNr1khvfmjJ9e5S
         SOWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721320603; x=1721925403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp8/fLygD9U9tIxzfcHMZD+F9R40NCV7rxcXjPvPL8Q=;
        b=Z4NsogpacpFYhMvZxELlUtvxYSDzW+6NyQyK8nM7BpG9WO66EmJ73q3jVmwotpkPrm
         hzskGDzvRHM99ruRk54omqcqsTe7DX/VFEW+c76wIL/MXfAblo6FCGf/xFOM6s9LF3Ax
         XXiTDOiApy3iE2GYHBFsc5bLv3iQ9HcjFmdRnlHYFeTw9emheawDWNVjL2kjUTayt8Un
         P9rIMttnTFsK+0Lz1ohiYUFp/PKgW1iecUKO8MUng9kQjoYUYn76SjiBlLYNvZJzIZVM
         dyNHtrWFjt58KzFK/+MoE4swvYkJgRdqmt/CHcfuay+iLYRfYhJ06npsSCrlOuBqZYJo
         ZToA==
X-Forwarded-Encrypted: i=1; AJvYcCXlJcSZGxVXvjs6iULFppyl3U0IF+G9srh8ykctWHb9oggxqlBc3l+blFBuq3vpJ++g9iK7outVTAGltDjXAWAQsrVew74xsA==
X-Gm-Message-State: AOJu0YxArH61ELVOnopEmzyo+YF0dLTtVvWBgN/GoM/R2dHYMvaf4a2R
	kxJ40TVW92/L3039q6RT6vSa+Gpmch+pHwbY2WYA8NVr16kpjH1ld7sQBp9YnzU=
X-Google-Smtp-Source: AGHT+IEkphSB8Ky31ndQ01h4iHggqOrWMN/HJDd0sIjy68IfxWOLpCRMxuiBEXTih2ZWzTmi5QbJyw==
X-Received: by 2002:a05:6870:6126:b0:261:679:d7f4 with SMTP id 586e51a60fabf-261067a21a9mr203005fac.25.1721320601349;
        Thu, 18 Jul 2024 09:36:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1a6d:d3d6:98e4:34e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260efbc4e3dsm386783fac.6.2024.07.18.09.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 09:36:40 -0700 (PDT)
Date: Thu, 18 Jul 2024 11:36:39 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <1a8e6672-5431-4125-8d10-b00da89f84e7@suswa.mountain>
References: <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
 <ZpWK0m7Ps6Y4vjL2@google.com>
 <2024071605-bulb-plop-9cea@gregkh>
 <87frs91qat.wl-tiwai@suse.de>
 <ad9720d8-6b4e-4f7c-bf72-b3c2db8887d4@suswa.mountain>
 <87v813w3v7.wl-tiwai@suse.de>
 <0c1d7d04-8040-4843-8aec-59c155273f84@suswa.mountain>
 <631f4f690b90dd3047f60cb4b77591e73ad144e7.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <631f4f690b90dd3047f60cb4b77591e73ad144e7.camel@HansenPartnership.com>

On Thu, Jul 18, 2024 at 10:56:14AM -0400, James Bottomley wrote:
> On Thu, 2024-07-18 at 09:48 -0500, Dan Carpenter wrote:
> > On Thu, Jul 18, 2024 at 09:34:04AM +0200, Takashi Iwai wrote:
> [...]
> > > It's no "regression", per se, but
> > > a new feature that didn't exist in the past, after all.
> > > 
> > 
> > If it's not a regression then don't add a Fixes tag.
> 
> Really, no, that's what got us into this issue in the first place: if
> you only tag regressions with Fixes:, then we don't need cc:stable. 
> Fixes: should be for anything that updated what was done in that prior
> commit (including white space and spellings).  That way there's no
> debate about whether it should apply and it's easy for Maintainers to
> verify.

I'm honestly surprised you would say this.  You're very much in the
minority view here.  I've reviewed over a thousand spelling mistake
fixes across the whole tree as part of kernel-janitors and I don't
remember anyone asking for a Fixes tag.

The one area where people debate is for harmless static checker fixes
such as deleting an unnecessary variable, but the majority of
maintainers say that doesn't qualify for a Fixes tag.

The majority opinion is that Fixes is only for bugs.

regards,
dan carpenter

