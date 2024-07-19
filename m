Return-Path: <ksummit+bounces-1448-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4F493720A
	for <lists@lfdr.de>; Fri, 19 Jul 2024 03:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5AC528251E
	for <lists@lfdr.de>; Fri, 19 Jul 2024 01:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D68E15D1;
	Fri, 19 Jul 2024 01:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uf5o6ykK"
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7E91FA5
	for <ksummit@lists.linux.dev>; Fri, 19 Jul 2024 01:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721352920; cv=none; b=MF+P3rSSPupNZmJFzlnWLRAwLTLOZtsmcMrAt7bX2Or1CrdnbGrHsnvooIXveknKATAuN4jYL5ze9AF4v6b2ewclJNYJ312UJG3jQ1x1u8CACuuWjkOhfoKcyL0GaIJkPoYEGCqVVJXTVaFFZmLn4GCZBQSj5unZ/FCF4xih1As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721352920; c=relaxed/simple;
	bh=Jfw5S0ArwdMcuusFyl2l1bina4OYLoYkvu+ahOqey1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2gaZUm2jittYMoHj5LQCY8piC50KCwLCGQCc2Rb1y0rkFIPDa0CAArqJCDV2vjF9vJMVCM/sxZ2oqygTLI/pNascnRnRexMC+8LIEUSgLOD/I84tmdnwDrqOZ1JkakdgNftza+QYRpB3WlVfA+xZM4k/YtIwQQTfShjQdF4wvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uf5o6ykK; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-260fff38792so493674fac.1
        for <ksummit@lists.linux.dev>; Thu, 18 Jul 2024 18:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721352918; x=1721957718; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RayRIGnI2WiYCjgMN1yLuNFm6OZfmLmdi1IvOwvo6jU=;
        b=Uf5o6ykKWyEZtiTWzR6P3Df3aWOGYPYMXCWmZrcbyegkXUKoqN3+IyBGQdImsFgMZK
         61iiSLJkPztODSzDzsm3xk950UuXPyIQgscrkuomtIuB5Pt2o9F+aw8Ou4e+Y1cIkcjf
         0F76ZhGbJOzQF0+ub4Qok8rif+CBEqUwpsZRgBpq5PsqywyK+7ZOveHSI4aRvayX12TX
         BHBs2kheI9Dka+7ZYB0p/mWB4FMAElYIKSAHeAsUI1lKDJ9Oi8Ccm14+zuo3ucw/TEY2
         G0D+Qv7H+3Sgjxpou3wXg6bSMfsU1hvY+9pCyRBKYyyt/0UN35zAezHwdIwj1SOchxca
         xKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721352918; x=1721957718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RayRIGnI2WiYCjgMN1yLuNFm6OZfmLmdi1IvOwvo6jU=;
        b=MBFUFeLAxB5sEl2Ep61QO3XDCw5tEbCSzGYnK+dyNDH/5GiLh+lDD8vc7pn5DcDUsf
         Owor/A+3NX4nyVlviXn973iqdnf2Ezgn3wJrgVhGjaKdTO2IT6PyRyG8Y7ttRiHXEag9
         j5tl6p6aUaHhQkqGOHU+9hDTa0AlPtkst/FxitqqiaeoOQWilJ1EnDq50igUKY0kVEVw
         vnsfyi+8UFsqMV0erHc6QNPBfNIWm9I4DWDceR4I53OBQdgzuHAAnnGuVWcgY8VGL9l+
         ZcCAupZSNoEobtRE3hnJmMf2SKus2jvTaNTi31+j6Nn3GAAbftlPIB2GLJ1socn6uMPd
         ZunQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXtJEKqVAtV9r6oc2AEMeBxjS8+vS9WZhz+RFLAH6jz0Km5fffdbYSrQmY1zeVKRXA5pHmdPhN2WziRwmlwrYLT4xSDXpMog==
X-Gm-Message-State: AOJu0YxRamgxkhTspsNhCkzRjlFxZ/bKKO8ZhBiZtyO241Wf0ftGymGw
	7AgAgY2JV5hYuc0ciNNA3cCisV5PtC51EubrRaFQB6nt4010TWPpYAcEJTpSeEg=
X-Google-Smtp-Source: AGHT+IExMSwN2qY7czu8JrEsMNtXgr1lTjbaBepo8iMya4SA7URzIQi6D7Qn4TkdsE+va+2NVE40jw==
X-Received: by 2002:a05:6870:f28b:b0:260:fc34:1c7d with SMTP id 586e51a60fabf-260fc342157mr2431910fac.23.1721352918007;
        Thu, 18 Jul 2024 18:35:18 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1a6d:d3d6:98e4:34e1])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2610c7ce708sm112667fac.25.2024.07.18.18.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 18:35:17 -0700 (PDT)
Date: Thu, 18 Jul 2024 20:35:15 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: NeilBrown <neilb@suse.de>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Takashi Iwai <tiwai@suse.de>, Greg KH <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <3b661b6b-3236-45ed-8dfb-a1f1f1a38847@suswa.mountain>
References: <>
 <1a8e6672-5431-4125-8d10-b00da89f84e7@suswa.mountain>
 <172135015702.18529.2525570382769472437@noble.neil.brown.name>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172135015702.18529.2525570382769472437@noble.neil.brown.name>

On Fri, Jul 19, 2024 at 10:49:17AM +1000, NeilBrown wrote:
> On Fri, 19 Jul 2024, Dan Carpenter wrote:
> > On Thu, Jul 18, 2024 at 10:56:14AM -0400, James Bottomley wrote:
> > > On Thu, 2024-07-18 at 09:48 -0500, Dan Carpenter wrote:
> > > > On Thu, Jul 18, 2024 at 09:34:04AM +0200, Takashi Iwai wrote:
> > > [...]
> > > > > It's no "regression", per se, but
> > > > > a new feature that didn't exist in the past, after all.
> > > > > 
> > > > 
> > > > If it's not a regression then don't add a Fixes tag.
> > > 
> > > Really, no, that's what got us into this issue in the first place: if
> > > you only tag regressions with Fixes:, then we don't need cc:stable. 
> > > Fixes: should be for anything that updated what was done in that prior
> > > commit (including white space and spellings).  That way there's no
> > > debate about whether it should apply and it's easy for Maintainers to
> > > verify.
> > 
> > I'm honestly surprised you would say this.  You're very much in the
> > minority view here.  I've reviewed over a thousand spelling mistake
> > fixes across the whole tree as part of kernel-janitors and I don't
> > remember anyone asking for a Fixes tag.
> > 
> > The one area where people debate is for harmless static checker fixes
> > such as deleting an unnecessary variable, but the majority of
> > maintainers say that doesn't qualify for a Fixes tag.
> > 
> > The majority opinion is that Fixes is only for bugs.
> 
> First you said "regressions".  Then you said "bugs".  Which is it?
> 
> If I add a new feature that doesn't work as documented, it is clearly a
> bug.  I don't think it is a regression.  I think the patch that corrects
> the bug (either the code or the documentation or both) is a fix and
> should be marked as such.

Yeah.  I said that badly.  It should be for bugs.  Fixes tags mostly
point to "Add <support> for something".  They mostly aren't regressions.

regards,
dan carpenter




