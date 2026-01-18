Return-Path: <ksummit+bounces-2784-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 934AAD39970
	for <lists@lfdr.de>; Sun, 18 Jan 2026 20:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B69AE3007E7A
	for <lists@lfdr.de>; Sun, 18 Jan 2026 19:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF3F279DB1;
	Sun, 18 Jan 2026 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HISugnnv"
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2067248873
	for <ksummit@lists.linux.dev>; Sun, 18 Jan 2026 19:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768764829; cv=none; b=uwNOIT48rTwd+NmTU9oFTlrX7GhxzYQhG7lwv81lr5LrhvhIm1EDG0mX7SbNA2X48LVbgSHAWSdYfKarYYJaPosZRhbG+w9Nt4EogW4USAcCUUiWZhjP8gj3xiSLQ0blF3kIxkFjihI6MMlxGRnKQiezr+1ynNgzh1Gkq2gCAWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768764829; c=relaxed/simple;
	bh=AKR3eMWL6zHg+nKctSxSWnd3qEwAX5BIgCGV2foHpqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dt0yWd7TzsHRF+tMuJEshyH+gDDvdopyDd00VoPE5+P2HgoJrWWjjP+Essn30+h8YhIVZ8P1Lde0Xbvwa0go9mVNO235uVTY3pXGjINfjE/EyVxndpBM74WTUpCIMEWZPx3bNXIFf37WNPO3DfI0opO3BuuXwSc6xZAdIrr7z8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HISugnnv; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee301a06aso32388865e9.0
        for <ksummit@lists.linux.dev>; Sun, 18 Jan 2026 11:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768764826; x=1769369626; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCGffHwXbO5L2VRVDSYUp8+JhXbgsDHUs3A9I1vIj08=;
        b=HISugnnvT+dYwsO0dgSbGoggP1gCmVK5xUwsDWypnM8fYgfKGF8P5aDx+BeGd7OZfX
         Z72wDUpEsqPB+wKr1SWU4soRurzzLZK/VvWN4yj/9UfWrbCTWtbxMnVqm+W4+GrTTCwH
         cDSrwZPJ8BpYnq3Y1pT9TB74sfsGxiFycjkaX+FxHSyxvE015kFN23dFatxg9e+Iv4dy
         ekJtBUOzxX/6E6deeuAES1+v8ct7qBY+CsvojnYbNq81Z9w7HeM0P2GQWc59rU9GGdLq
         1jsGz/yZNF8jy+lvNbRdJnXOAlFSkTamVkisQily1oNZSNgMpaELq73B0s456FZySuJm
         KI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768764826; x=1769369626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DCGffHwXbO5L2VRVDSYUp8+JhXbgsDHUs3A9I1vIj08=;
        b=JkCdeiypqZ3wgmhrf4OSiEcYyX6nYSGnY0y5GZvx1SGeYubZf6dP4nXNnxW6a7apAe
         RFp6tsLXm6ZblkTBb/HqdvUl8MFCJ8Sh2Is+TCr7xAoUzPYn8cfK+q0wwNnDN7e9YmRb
         0DU1MJz45XMT6Dmvofz600+HvU6nEcejnMxjj2EQ4Bi5IA8eJ6PLFlF6MY+5bmAPsnXV
         ssDQkDbdfRT4uVYbDZ9QgxEFLzMV7dJYRaCiMqu2k+/KPgndx+1qTpixamkVuiY3mTMn
         tj/v5A+ahIlp+ysorNEkWo/v8M7XVuo0l2AmF8aLc9giHA2CkbAgJ6fwoqXNk8FR1+0U
         tuRA==
X-Forwarded-Encrypted: i=1; AJvYcCWVUY5epTMKhwXiGSoY5NVTxtEHQ/tz9xZBDs0t1mu/ySlNX4VNKCOr10VAlFaGGlfX+siSIs4B@lists.linux.dev
X-Gm-Message-State: AOJu0YzBtY/eJqvw5SHdANTMH0U9WCK4DeP0F/09QpElYr6RO6JRcFGX
	irIwvKW46hA7qijdcHXcXiCwfT3v4CM4pNHCBzeUELu6kn7LkDtNKP4pHxvo3z/4CYNVjywtAVk
	yflBt
X-Gm-Gg: AY/fxX5jSMDAWvsxpEtb1z56BS2G8Ocz/3cF0ut0D14xeR8Igs4iAVXryQor6o5Tviv
	VuYF9xSAxuzmH5unWlt4Abzr5/B4yGRAZwyF+Kfo0m8RqjSU/FRenbn30LR68MDytuZzDXH2DYb
	ANE5d3dXeW+qiztmajf1L1Noa7l1GH6Vr4KsnP/jxA6vvcJOu367q3E/6bc5azeO8008YbtWTJz
	UoFhBpkO2Q2h2zmd9eslUmMpFwAe5MyGghFmLlUYvcKUvWY8UUBOcZlAMosl1lc7xtEKRtYVmZm
	9g5vdgmbDXk2HY1p7ygJ7wHudE52CK609kI694sNyxV+uJaW1ONlaAFIKaXXr/OiXKWC7jvN9Uy
	Wy97NOc2/AUEtwTHu//c21+Eh2bZUtgv4mjIvcl0WvGHJOJeB2y5JrtS55OKOG//ThYBzi4cFhW
	58P0sDiHDxc4c/tGk7
X-Received: by 2002:a05:600c:198e:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-4801eaadc94mr100700555e9.6.1768764826120;
        Sun, 18 Jan 2026 11:33:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c0499sm158271425e9.9.2026.01.18.11.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 11:33:45 -0800 (PST)
Date: Sun, 18 Jan 2026 22:33:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <aW01ludvLz9xNzkd@stanley.mountain>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
 <aVUUXAKjiNroU5tR@black.igk.intel.com>
 <20260102095029.03481f90@gandalf.local.home>
 <38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
 <20260118110454.4d51a50a@robin>
 <d187bc4bb0ff1de7812cc4d1673a55b45cb59d68.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d187bc4bb0ff1de7812cc4d1673a55b45cb59d68.camel@HansenPartnership.com>

On Sun, Jan 18, 2026 at 02:17:30PM -0500, James Bottomley wrote:
> > > Duplicate header are trivially caught by tooling.
> > > 
> > > But such rules aren't useful either -- I've seen that Python IDEs
> > > hide import list by default (and probably manage it) because it is
> > > not "real" code.
> > > 
> > > Rules for initializers can be harmful because ordering affects code
> > > generation.
> > 
> > I agree. I still prefer the upside-down x-mas tree approach for
> > declaring variables, but obviously if they also get initialized, then
> > that trumps aesthetic reasoning.
> 
> How is any of this relevant to a style document?  You're quibbling over
> individual maintainer foibles which, while they may be deeply held to
> you (and obviously are relevant to contributors to your subsystems
> because they need to know your foibles), can't be part of our universal
> advice because not all maintainers agree (not even on the direction of
> the Christmas Tree).
> 

The direction of the Christmas Tree is always upside down.  That's a
standard in networking and a bunch of other subsystems.  Otherwise
people don't care.  I've seen people who write code in Right Side Up
Christmas Tree style but they don't reject code which is in a different
order.

If you're working across the entire kernel like I do then it's safest
to assume Upside Down Christmas Tree is the rule.

regards,
dan carpenter


