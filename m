Return-Path: <ksummit+bounces-2362-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9157FB53BC8
	for <lists@lfdr.de>; Thu, 11 Sep 2025 20:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACC011CC7B49
	for <lists@lfdr.de>; Thu, 11 Sep 2025 18:46:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1383C2DC79C;
	Thu, 11 Sep 2025 18:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhdYIEPl"
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB395F4FA
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 18:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757616352; cv=none; b=EALKPEh7vgSo5Aa93ergAPqmRabf4e5iLp5wbcUCK8WbZZddekeQ9eAMiOQFfRpAifCBwwITFnI/YbyU6oSxvdOLAU6oZxFe9/4oadYBjFul18ouYPn/TcxJk2Fz6Uqs+B7iraBHQKVRwAaXZmNOpIxK0kFimSF4Q+fQ474m1zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757616352; c=relaxed/simple;
	bh=HbfHBjTNsekPLz6Ioa+pDATG8xKlRCBbRcS1nubSWB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hoMLrFDuHyX0kJGHSZEHQLZHQhfxhBk/7D81v+a1h4dKfBdr738AkSqBdTr0KOR5lwhn7Rk+RerhrosJDbmKPwIis1wyAbiNFjwIixo5KqpSh49kvdBt8rdnrgAsd3SiwC+Qe4zEgGcmYuiosM3LI2Zk1fXw5s+q0h9WY4q1E9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhdYIEPl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45de56a042dso7080205e9.3
        for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 11:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757616349; x=1758221149; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xAt4Vr8DKvShBvhc47p1I4Dhc6UNnnPMFHnU/GqPGlo=;
        b=IhdYIEPl5wDBwRMty+CRfss6hGAKnfz+d1z0iF9fNRDkzHEGaLSDMTiISAjdUziGs8
         /1zAQX7BqINoNysi6tKNBqYqGy5vzvhaTAyuCUrKtWrw9qlLtFFLBX/3gpSe2zgxn6ZC
         hkIYVZzFCuuKlBFnpfEo6coCBSn7oYBjRvebkdPh9/VRRRIu7xbcOFWGlDNZkKTx5e8K
         xLEmwWCRQJyZN1kHcZ+vLJZkjRoklrYGRmHt5JjxZTK6bYhJC3IuTyl5w3z3j0sH49w0
         Vf+VqUT27LV2Zo/ssDS6vj6D1ZaxDZvSUSAWwV+RpDF+GgTgkjJnFOzrW62iZpw8NcMv
         BzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757616349; x=1758221149;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xAt4Vr8DKvShBvhc47p1I4Dhc6UNnnPMFHnU/GqPGlo=;
        b=iCp0Bz+NRMuFDT8UjOEtm9qJPHtz7aZ78tChGV/KOiTZN/ZSNAFZ0JVZftxBAgWPuh
         VCUuMTszf9sOHgu+WRLvguk+dswy7RTu65f1kAFHA9Rv8TqrRJDTw5Q3sWh5K+VogTtp
         ypKo64jQG7+FFIr9rTmBi/L4c7tJV22q2lsQBXgrozHSFpooJuKqstQ7ETjO2YlBnmVt
         PdbZHavn5kl2r6Yrv7SCEJU4r7pSe/hUQgeQUNDM7+lrPfLh8R+Ta5AmciGqVRgipjV3
         lQ140ZcrFcBmJG+9/shlYBluoOFCfJMenD4u6WKFgnHrFzoXTR7vxnto1EqAv19f0Pqk
         vn2g==
X-Forwarded-Encrypted: i=1; AJvYcCWX7liBGs5QOcCKULy/piAVP5v1Jb1HopNT//rs1P+BLMlpUPD94/tacXErnGPftfEPZ+oQTDGE@lists.linux.dev
X-Gm-Message-State: AOJu0YyXFgeNyXOfxFOkEJ2xflcZobVwRKD/+nD6JmVqWD/CfFcFlyAW
	Oi/M658kq+tHRZOLouYlyrLvTYCQ8/KLg+5DNBbQHcmA2MPviiEjfl+pczjck/kAPWg=
X-Gm-Gg: ASbGncvw+PL31RZ/eZ9n5fDJMd1jB14fuRLgutSG7y+sOQECDEny3oiZtGDLsDoMp1e
	fhEnmE/pR/ErBAmN8EFXkpSaMIKqAE2myzLKdKAGxa1DE++CacEVtod7F3dtNx4NivFCbiX7yJA
	Hz+R0nQgup+blyWDqWkHsVAlkRB073CAtSvmfrWp4N+LfhgEGfRXuls035Pu+UsaOG5qpXVR4nc
	WWFQj11LoE66R900UqvSbFpA3qpQCXtX5f450tmX3bqOK03DrIee3CpvlZ0ugF3wYe8LfB76NAW
	Wkv6QBcaRGJMBvloWEwV1iEFZLw5IuMAli7lgRFiSqac9cw0lrW4kY6H0lf/jfkFsiIBsFoFNxz
	7RxGvwWiWo/llmal+O7wmcn4mXYJWSr5Ep5RZsQ==
X-Google-Smtp-Source: AGHT+IFDTQbSRBU/aiauuJz5HkQOIp5D8OAjH4aWkdrxeVPoWew2o/gzKNixsT4vY5pfOUQkJT6aCw==
X-Received: by 2002:a05:600c:45c4:b0:45b:9912:9f30 with SMTP id 5b1f17b1804b1-45f211ca9a5mr4614015e9.6.1757616349048;
        Thu, 11 Sep 2025 11:45:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607e40a5sm3365450f8f.60.2025.09.11.11.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:45:48 -0700 (PDT)
Date: Thu, 11 Sep 2025 21:45:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
Message-ID: <aMMY2W33nmoJafDe@stanley.mountain>
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org>
 <14357de0-ca64-4605-87d3-64d3015d973e@sirena.org.uk>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <14357de0-ca64-4605-87d3-64d3015d973e@sirena.org.uk>

On Thu, Sep 11, 2025 at 01:05:36PM +0100, Mark Brown wrote:
> On Thu, Sep 11, 2025 at 01:04:19PM +0200, Krzysztof Kozlowski wrote:
> 
> > I don’t see a good reason to keep valid, proper patches - collected by
> > trusted sub-maintainers and intended for upstream submission - out of
> > linux-next. If a sub-maintainer is trusted in collecting patches and
> > sending them to the upstream maintainer, these commits should be visible
> > in the linux-next.
> 
> > I have occasionally asked sub-maintainers to add their trees to the
> > linux-next, and sometimes this worked. In other cases it could not work
> > for various reasons, e.g. workflow of the upstream maintainer or
> > reluctance to share commits early. These reasons are what I would like
> > to discuss and, hopefully, improve.
> 
> Yes, this is especially frustrating when it's fixes trees and you end up
> with breakage in -next for a week or whatever while you wait for a fix
> to make it's way to the upstream maintainer's tree.

One thing that would help is if someone breaks linux-next and then post
the fix but also let us know when it will be merged into linux-next.
Sometimes people fix the patch silently without responding to the bug
report.  Or they post the patch and we assume it's going to be merged
the next day but they want to test it for an extra day or two first.

regards,
dan carpenter

