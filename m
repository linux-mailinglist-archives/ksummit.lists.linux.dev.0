Return-Path: <ksummit+bounces-2368-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CADB54669
	for <lists@lfdr.de>; Fri, 12 Sep 2025 11:04:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2951B3A822C
	for <lists@lfdr.de>; Fri, 12 Sep 2025 09:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19C4274669;
	Fri, 12 Sep 2025 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s07yi4Sg"
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCDB2DC79E
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667837; cv=none; b=baP0E0fQw6pXECC4uSHepQRuoGVNoMwjUdVeRf1sJGu8bIWldzmckffxt3rujaB6ALhpPnCm2OZIRY0iKDI/sKCn9sfm2wrpS5yzch6bbDyYxteC2fnT6hE/0eL+dlaUhih5nvJfwy8d+pRHC54DX8AF8gi+EdS7pEZ+UaNLbf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667837; c=relaxed/simple;
	bh=fY0R1GCKpzhwtX27l1UggUnoFxzQ0fHSz08El/7QoM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhQGVqDlvYNhN7fg8ILOLzhqUtnTUd+rC/JQpqTxxOObfn9PjHyTqIXMBU4QMJtxOIbPaF+yZDwyKWiJDBqHThcGmn4cPrkAlKSjqRhazEy+2hB4AU+/D/s76g7LA5Ncd64Fm/OK1yMM8sLcCbOqfAKUlFW4uT8XmCR1fRVgZ+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s07yi4Sg; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso1293228f8f.0
        for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 02:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757667834; x=1758272634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8SaFmXrh3FM3jLIDqGrE9GC8pk92WtsI7sIVhdLFy7Q=;
        b=s07yi4SgmkAEEj0yRb3ExyjceQwdiXHeurenf5IwhEn7DpOW8eE0qI/WVE22SusPbq
         2s/4jV5+mL2QeNeXoWy0t/QB9S9ggi2XCkMpqFuFoexpeC2WAyCcE3hO76ezUC8OP6kK
         XTLriuuEhiLniha5BGfxKer3SqEehKPa1Y0+v64gwHgE5C16NybsFJrigkRVQ70w/Be4
         mHhXPTAqv1Mj85JQ0bH6g7r3fDIbQI7i8n4D/5WqTMA3EdNtt+cy1MF5FxyQIg0qPHXH
         3jiQ2WLBPCtjm0Zd0IURas2F0aZIz7/cUlCllAJdaEVaL8c9UfP1Za+/9hwChpsSfH+g
         80uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757667834; x=1758272634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SaFmXrh3FM3jLIDqGrE9GC8pk92WtsI7sIVhdLFy7Q=;
        b=vpS69AEzwqgRdJT6GCDybwm5ubI7ddRdPozJhvHNj3T1ZSkfB6y4o4je68SevpoLpU
         72gHROfU45GjrHe3I+xenGGPhCLBN4plHtxW3IxICuoGjmFLtIhMiKWpDv8uZ/0mfVnw
         E2yWtRG8Bxb0VNSqLX1FCj+Wai+OUSiJJ3yCg8QUudkbBQMGNqe078WowLhs87fRBlw+
         i9sv537Q9ZLRyBtHfDJ743dIhoyX/y3RlbDzMdStLVhgfsZFFnm/ua2+3+VhuRgfghcP
         gY+RrEpefWlmJaqV69VjuZpB6O2HAw/BswfBm1sfz27roFqSc5keenxCGYlZgfXeLKW0
         UkBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUwvnVN2lTMYw7vMvKrQnx71iU8HmnatmyFi07rfMBnbp8+vCoG5TPQdGKj9Lb+jR0sSPVsOZ8@lists.linux.dev
X-Gm-Message-State: AOJu0YzkqfEQ283eGtg6poVHczspcpx8KtG9ptSjNNeJplYIfFxbDUn0
	aSfZJgU7b/GJGwPjDbaHZS8yvrAR05bBkAGjmlpvg8qmS/p8nBjE3bQYMD4lZh+APxfD8QWdCIs
	xg7af
X-Gm-Gg: ASbGnctlgceFVRlOPvqSd0JIEcR6gYthG+mWUKwWq3gPQzVIvV1s9M42zE/9qLNVmw8
	qPNgAXpmbcBgfzU140V9XIS73Nz6ciCc8IsrCsErm5vrILrm/ShiMUWHhVBH3zmNPybKjxnHm6U
	4WFYRl859pQabEAHXBd9gc3Hi5Rjt5q3dCiwcyU//LWesERqfajKom9AOmYXV+dj1ciZ2B/wKq5
	8iuYsL9BxfWrj4XdOK4tRQE291akpIqcO+M/nCaoWH8K3ymrkEzIA2O2aQ7vs6MUMxi1ra7+m7/
	eavC3/OMSeIoGY8AcOpvSoJX/aqsUfWAwceVv3ykPkASyIyHe8hwPXQ+N7/KeAuBKPM4rjKaZrX
	yjD0d7dX8VsZ/E86RBmyNk4/QgQsu90ayETLtYg==
X-Google-Smtp-Source: AGHT+IFWQ8oqYywb0b3HdSVV14WgMe/AzNgwxMn35Ec9cMmsVNiuRJ4nga5Wono9WyxwlW6ESaadTg==
X-Received: by 2002:a05:6000:3101:b0:3ca:3206:29f with SMTP id ffacd0b85a97d-3e765a2d9f1mr2301587f8f.40.1757667833835;
        Fri, 12 Sep 2025 02:03:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e766659ea0sm2396729f8f.43.2025.09.12.02.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:03:53 -0700 (PDT)
Date: Fri, 12 Sep 2025 12:03:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <aMPh9txLGMTssmMz@stanley.mountain>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <20250911122711.GC8177@pendragon.ideasonboard.com>
 <CACMJSeuq3VrVHNoZ8Usnfkw7bSwF+f6rL1WPz0R4WRnCb6zypQ@mail.gmail.com>
 <20250911123333.GD13915@pendragon.ideasonboard.com>
 <ed3b0fbf-2518-4a96-9ca5-22ed37965395@kernel.org>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed3b0fbf-2518-4a96-9ca5-22ed37965395@kernel.org>

On Thu, Sep 11, 2025 at 02:42:47PM +0200, Krzysztof Kozlowski wrote:
> I think DRM is even weirder here - already discussed in the past - where
> they cherry-pick commits between branches causing duplicates and
> reference other commit while not feeding them to linux-next promptly. I
> still remember the one RC pull request from Intel to DRM which had
> commits like:
> 
>     Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>     Link: https://patchwork.freedesktop.org/patch/msgid ...
>     (cherry picked from commit 97b6784753da06d9d40232328efc5c5367e53417)
>     Signed-off-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> 
> and when on linux-next you try to figure our what was the source here,
> you get:
> $ git show 97b6784753da06d9d40232328efc5c5367e53417
> fatal: bad object 97b6784753da06d9d40232328efc5c5367e53417
> (Tried with repo having several maintainer repos and the linux-next THAT
> time; now it works...)

Yeah.  There is the issue of you have a Fixes tag but can't figure out
which commit the Fixes tag is referencing.  And then there is the
reverse where you backporting a patch and you want to see if there are
any Fixes for that commit.  Duplicated hashes messes up the search
both ways.

regards,
dan carpenter

