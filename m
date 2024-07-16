Return-Path: <ksummit+bounces-1441-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D34CA933240
	for <lists@lfdr.de>; Tue, 16 Jul 2024 21:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10A1F1C22593
	for <lists@lfdr.de>; Tue, 16 Jul 2024 19:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53761A0720;
	Tue, 16 Jul 2024 19:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ykNmyoz6"
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF891A00DF
	for <ksummit@lists.linux.dev>; Tue, 16 Jul 2024 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721158734; cv=none; b=Aw+5Syz5iAUrWTPUYGrLIrFeWIpAqmf9kfEpFk/Rb5tKILVWdjyImf1scv4rkhtosIxluyQ3PJy8jj0BvLnn4BrhIk4r+cC5ohs0M6GZXQmh11UQQ9wnSN/dGnJDU0LNcjd8DC6Jalv0Eo0MePwUsaYwNiJ1CddcCQsco0p9Cos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721158734; c=relaxed/simple;
	bh=72sPHQpxMlbCtWgBu6AUFELCgJWYs3ShdTsvGP+Q4UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xo8YtXGlJ0vEYdzASk7Oxugic0vMWPLxmLjEpWTD1oQZ1zvcgNQ+T/0xpWVtZ+K41un7TOlgdKDBQEC4fJ6SOCBBXoZI2+zp5rGBcMPWyb60SmTKR/BV6H0JQdOXCYA66dE8Z4F58wGlEW80ulr/jC6y7RiXbUAJ8MsM/9zPjw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ykNmyoz6; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d9306100b5so3715239b6e.1
        for <ksummit@lists.linux.dev>; Tue, 16 Jul 2024 12:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721158732; x=1721763532; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yJi53kgZxfFBsFKhagT9asiHf8oY1CqCq516MivcuhY=;
        b=ykNmyoz64GnMd6fXKj2M/kpSzfLLnBmNTRPOgowvG1zNpLLV3wNURmoEXoA9Op5Xnd
         3i3g6LSwklLOtnerHH5VVi0LDgJITveB/40UkywrEeagpBYy6oRn0rvXB/arxQrcRXvI
         VwGYCxMHS8PB/9K09WllululUac+9yxt8VQBacc7bEiIz9+tQ51Qjo6zVuvywl009VdQ
         tBwwHjvzDHXRfPv+p5Zbqb4T3S30MNC/Zshv9jbnPC69usAwXCmTpRMKZYoTxkzE7vLK
         gvJq+DTfmBETo1KMH4a62FWpwoLon+imuKIrZrFbPilk+SDQ8AXSY8cVzGNoTr0k725l
         36vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721158732; x=1721763532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yJi53kgZxfFBsFKhagT9asiHf8oY1CqCq516MivcuhY=;
        b=IF+RFgzzjCPl1g9zzZOxfNyWEMPDOaqO8Qon56T/lUc/FeH2IZTf3f7F2TCYRQtVkk
         c/yoENkcDFTmFzG7U+ZbU50yDAsHa/Nx74O/qfX8ZG0hsVuIXwoM7vPVc4kQo59oMKnL
         eUWr4x2t+vre2F/MoIsWYMex+tQugrHqAFJXHfU5XxPMRwoRDg5XiT/O0Q4v8TD+JEOq
         XmAt69Zl8Pdjs+7XcER3lTvsAIyCqqXLtWwCVSWgwMlFjMBYU32E4BJF6MbGG//ppCNW
         qDLYgCgbcWVmNQ9q0qLlnwhHKQXmK5jF//KMJCrYOfI9NmzRTRNi1dIV9tiQ7MmOEgp4
         As7g==
X-Forwarded-Encrypted: i=1; AJvYcCU8IiB/ax1SmXWozbS3HsHa94wCc/+OrEfA+Y+tW3m0OF5jssdDUJ2tjdPOgQuTQnNv8B4ZLDaf+dKIUSwBOmEhsiIeQlOtYQ==
X-Gm-Message-State: AOJu0YyZq1aoLwlmQBGes6Olf2juc6VKwzj0pS8m0jlVRmYl4Mw8nE96
	ac1uhMzAojqE2PCJ7InPA8fEkI5IkcP9dMIEJ1+V1S8LkbQzYOIAB83sIb0FpRg=
X-Google-Smtp-Source: AGHT+IF7LpjcTWvCHNIjSXdrYfl3BdNQCdgU/1Lg4lZUJv48bWDKOIXbwCS+uzzF/I2ApX1LZ/U4SQ==
X-Received: by 2002:a05:6870:638c:b0:25e:fb9:4116 with SMTP id 586e51a60fabf-260ba5198a6mr2950514fac.14.1721158731651;
        Tue, 16 Jul 2024 12:38:51 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:b5d2:9b28:de1e:aebb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-26075136084sm1437686fac.19.2024.07.16.12.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 12:38:50 -0700 (PDT)
Date: Tue, 16 Jul 2024 14:38:48 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <a97d832e-2848-4c8a-a4f7-00497a4f906e@suswa.mountain>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <20240716145123.GA2254116@nvidia.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716145123.GA2254116@nvidia.com>

On Tue, Jul 16, 2024 at 11:51:23AM -0300, Jason Gunthorpe wrote:
> On Sun, Jul 14, 2024 at 03:20:48PM -0400, James Bottomley wrote:
> 
> > Here you seem to be assuming that every commit with a Fixes tag for a
> > prior release should be in stable ... I don't think that's true at all.
> 
> I think that is the main issue here. Having talked to enough people in
> the server/enterprise space there are a lot of different ideas about
> what should be backported into the various kernel forks out there.
> 
> Just looking at the patch meta data there is a spectrum of:
>    No-Fixes -> Fixes -> Fixes&Stable

(I've been looking at stable kernels for Linaro).

There are a few reasons to apply patches without Fixes tags.

1) Quite a few patches that should have Fixes tags don't.  For example
   syzbot stuff should always get a Fixes tag.
2) Sometimes we don't realize it's a fix until later.
3) Adding PCI IDs.
4) Other fixes depend on cleanups before they can be backported.
   For example, this patch:
   https://lore.kernel.org/all/20240429133832.9547-1-kabel@kernel.org/
   It's a one line fix.  But it's easier to apply if we apply it if we
   apply a couple other patches first.
   https://lore.kernel.org/all/20180319100523.24498-2-u.kleine-koenig@pengutronix.de/
   https://lore.kernel.org/all/20191105001301.27966-3-andrew@lunn.ch/
   The second patch doesn't do anything, but now the fix can be applied
   cleanly.

regards,
dan carpenter


