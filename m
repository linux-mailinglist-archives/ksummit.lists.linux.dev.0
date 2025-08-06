Return-Path: <ksummit+bounces-2084-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96739B1BF7A
	for <lists@lfdr.de>; Wed,  6 Aug 2025 06:04:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E37118A2F57
	for <lists@lfdr.de>; Wed,  6 Aug 2025 04:04:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EF81993B7;
	Wed,  6 Aug 2025 04:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cok4ycG1"
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DC641C63
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 04:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754453044; cv=none; b=HvJm6dIo0Ya3Tj1hkAfhZIJ5mg5S5BsbdBiJLLnrXPHUbh9YvxC/ged5enmELjNz1x6itUWOV31rw4LD0wXJbAKIuT858UnzTbiCfakZWzu7+DOaBaz+yA+IuQhPDik6aUyD+GLhkLxnrdpRoO73KaZDaIdGLRYsDBujpCCtsKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754453044; c=relaxed/simple;
	bh=hr5Xs4xvTFeEzA0DCxAYPzjQaY1LMUa7ktxspsNbScM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9qvd2r6GtVZASmP0dOYRcMGFRA3ZQcRJDr/MLblnOyeMaRTq/RaQs+v/dZpshsTJHbksUyU/oCL6vyMF8SHq1NoXfoG7gdY3ziFkmB4188cmFoa64OS5QUNuDNIYFKbb6eLzgjZGmI4FmirRNVzbGF8skGI7Lj8dyh6zIOCNME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cok4ycG1; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-615c8ca53efso10432831a12.2
        for <ksummit@lists.linux.dev>; Tue, 05 Aug 2025 21:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754453041; x=1755057841; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hr5Xs4xvTFeEzA0DCxAYPzjQaY1LMUa7ktxspsNbScM=;
        b=cok4ycG13MpFtbTuoH32YXZAwhbbEx80x+dqf3PjH4haCmbsKVc7zIVjMRIrn4gJgl
         bfHbpd/4QnHhpqLPaJ6YDtWolfuN+VEVgEIPnQC7Xzxy5en+5aAp0LjqBDkvR4/TGw4R
         BM3G6TsEJjDOqhVDSjCg8y4dI4cNr8ZU7sKZsRT8tXLAXd5NU+zolv0SOhBGoXmrI4c1
         6lq91KrzKABHuf9CxKYY6I4q39kRmEZOdoJg+QmTjx0i97oPgHPML6lBQOfSS3yXX1gW
         1jHE6x5U3LTS1xyDgKc8FHYJDaDyQiNySU+wBOLs6hx5CvUMDKKMncMzlWFmapiMWXcx
         /ajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754453041; x=1755057841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hr5Xs4xvTFeEzA0DCxAYPzjQaY1LMUa7ktxspsNbScM=;
        b=W5RIdgWoMSotTHIHJjF7UbfnqQzd7RWBV8Gect6hS4uhEODGJ/z42ORI9TE0ePSqXy
         AKI7E0/GYVoL0sC7KY1/v+xPJBVUPMbPqdeT5vhsYoJJ4F4aGCJS91j4/bKNT3+wL7YE
         L3Fq0zdUB4Vnpnt9S9rK2leL/KFdcB76TtKq2e0I7sXT1BZZHHoKYvttdLTLwD5BOxX7
         CxS8VJo9OC4nufc6ppQYhSu13VMRBiAH1aWZYc/zJFOkl9R4vi2eVjJYnVrDEuUEo+J2
         8w1tiP2yS1jrWuflhqxJVHuqo1X/ZUPaPUKYXHhsRieq+kvLrDPgmlLbb4nUKdbjHnkl
         cV1w==
X-Forwarded-Encrypted: i=1; AJvYcCVlDagwnQOH57x94Ib68HL0NbP6mkmsxSdivgeKqWgpqtsLITGS9+H9t9D5+dGxua2qYiEcVC6b@lists.linux.dev
X-Gm-Message-State: AOJu0YwakHRvCQVq0SYX6c6ZLirHhOKJybYkAy4A3c/0cjQYBeinF6Ux
	cXQGko33GbIFIXURZksUWvbpcOP4woqhmVCVd+Tb0jlYkfCUEK2b3cA=
X-Gm-Gg: ASbGncvgfiqI33aoV+VH2iK4UnK4kXoszKqGv5VmdnSt/kdB4WsQY/mVtLdWymYY10Z
	436eZz9D+BjGWQ/UWRg3Tb/QBYLXXMtLVpD/6N+4+ETMW3xoWNPCpd3iiffU16+qTZaE+h4QnbL
	Bf/C7bLTy53GnN8LSTIXK752I64lR3/YGv1MlxTIQzpTPm8omQLTg6rOBddlSwt6+R2uFk423fV
	8a6PMVuaVDRQt6T0ji2FCR+KHw+XK5cjUZal92CCf7DMTytNfbxDjDSz89SYmNMndbAu0gnC53z
	OEM3iHcp14Ma2OhJw0oqfvRfI8mnCD29TDUhEdh8lw21Rark3HVRKFmKorDInc/v1fz4In6I/Ze
	2iCu2LfByqumI2HOymp+Z
X-Google-Smtp-Source: AGHT+IFzUBo2XZrmP2LbR7cBpOUgc4ZxUateFr56P4ANDxjcoovDpntL13AwV7ZiHK8KB2WRW8anvA==
X-Received: by 2002:a17:907:7247:b0:ae4:a17:e6d2 with SMTP id a640c23a62f3a-af9900c26admr131544066b.24.1754453040482;
        Tue, 05 Aug 2025 21:04:00 -0700 (PDT)
Received: from p183 ([46.53.251.116])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a0a38aasm1021476566b.37.2025.08.05.21.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 21:03:59 -0700 (PDT)
Date: Wed, 6 Aug 2025 07:04:02 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The role of AI and LLMs in the kernel
 process
Message-ID: <aJLUMuEhFsSxHgPM@p183>
References: <e3188fe2-4b6c-4cb2-b5ae-d36c27de6832@lucifer.local>
 <56e85d392471beea3322d19bde368920ba6323b6.camel@HansenPartnership.com>
 <c8daa784-4c51-4d65-b134-244194dce300@lucifer.local>
 <aJJP2BM658FYJdJv@lappy>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aJJP2BM658FYJdJv@lappy>

On Tue, Aug 05, 2025 at 02:39:20PM -0400, Sasha Levin wrote:
> I don't think we should expect a bar for AI that is higher than the one
> we set for humans.

We absolutely should.

There is a thing with computers is that they are perfect. They are so
infinitely perfect compared to humans that anything downgrading computers
levels of perfection to humans level of perfection must be rejected
because it can't be scaled back and thus will be permanent loss.

Would you install calculator application which you know reports wrong
results 1% of the time?

Would you uninstall calculator after realizing it has 1% bug rate?

