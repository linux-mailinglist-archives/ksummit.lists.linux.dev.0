Return-Path: <ksummit+bounces-2341-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3684DB53257
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7D63A87DCB
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:32:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B94B321F38;
	Thu, 11 Sep 2025 12:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IWCjhTjj"
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AAA3218DE
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757593897; cv=none; b=Evy7mn2LzfgmXDAe4GU1n4gjhRz20S81xovNIkzuO2J5ZQWKZtuA31pHxrq1RGA1RXzIu2iF24H3sxtohbYT/1jKMETUBPkUXuRVsOXHUBJpjyhpalS4SJnCVmlRNb5/0DLbzvwFlTR3ClI8jo0PJOcKNCDdD939Byhxmho1Z6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757593897; c=relaxed/simple;
	bh=FuI1Ni5gcZG0CAyj9csi8Ed7x3J3FARUjkQEFWWZqbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SR8mP6VA+1gDkRYD7n8DwiOUlBbuHeVsR9e/UkqE3aUmm+RNdmIJEGwJX6W5Prhsf4hvxhe289ECYmKu3MyHtsWYef7z0XjDECY9KV29Co030YwmJwhCY6L6YpuF/fYmEuKGq513etTqDbsTx7tVqRfgZSLQFyn34cA1aMDHfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IWCjhTjj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6237202020bso1003701a12.3
        for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 05:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757593894; x=1758198694; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FuI1Ni5gcZG0CAyj9csi8Ed7x3J3FARUjkQEFWWZqbQ=;
        b=IWCjhTjjdHFYRkyZJhW/bV/OPp2UOaqinM94yZzefBRSrUKiDlNu2Kui3xQw7FEVyq
         eHM3nM9e+vgsMHXDriXL88tk6/WcYvedL6pe/P4Sd5iVrQTOTHfoGxnhC/S46EJGuOiA
         vg6AesUEkGNJ9lic3C1D9P8HTeqr66AVqkM4Z3XgdtU1ad6X/G1QaHOuGrLmrX1N4dvs
         m3W+S8PuoGZ2HvTLLmwtef4dEIQzpUKueumApats1b2I+ub3Tt8xSO9gd8WFOxzpRRMP
         5liVBCSpJe9aW42Wr2zlqazWPxmtoOqjTbmMvkRpddjwx73gMWlFblD748OvihVoh9ra
         bZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757593894; x=1758198694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FuI1Ni5gcZG0CAyj9csi8Ed7x3J3FARUjkQEFWWZqbQ=;
        b=puR7Ta0090E5y7pA687m2+NGLbONYXqz1wzGeRmVe6suGCcI/VkXWIeApAn4Qjt/jw
         +kEG9bYblKprg9zRGfDAbcfGpU1OIc13y8+xolcCUTFcW1RSBPaXR5oYdBzjIf+y6vz2
         z6dlmh3PBDMQGD86yw4bbvpAakE0st/rBN/0fn8nzUIUU9/G2uXsKbLa7LUVv91coxsq
         ohqdcOTtNHlQRUHuhp5wJkIt2L/Bf/+f9j5cO4wFBLrc7pqWe7f3zybq+kQ6VxV/wrNt
         12qnamGDX5Vb1OY1yL45/PHrI25pnoL6vbnhNTG0b+GjzViFM6OU6K6yVo7C01rcvG1r
         W+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCVwsi6orzY2W9WQdcOqcZF5tdELNmIw68B32JF1gXr/uU4YvfFuPYSWTbAesRniHOKlW/gnH4GU@lists.linux.dev
X-Gm-Message-State: AOJu0YxDfyWcnoCEjIxL2wNdDNgZWmSfx+E/lXOW4QHIVPv8Wqxw2tWM
	yt0npW+m8/P5QtgRuHMhKQ5TyR63I01qqpP2j6PDk9X8CkyFQ5toVVauhXk57RFOJ1Up4Izksvp
	V/erpMb/6t+fs2D4iyFgdk/ylb7hkg1RFjsVaZT7POQ==
X-Gm-Gg: ASbGncu5MwE19MBpKnbgYzQRzuvhoEc9SxFrLJtNUSMk6TQhpAWgD5DMnsZsT0918mt
	pDasu3sP1mgFSxjgTybh0KoJLbN4vfRCVsZisDaqh3v1xY7lbpDLRcd06cswfYDj66fFdztNRfL
	BStDvUsjQNyhMRh3JGT52PhVP1cZGZl5sxbruJMagIXJp/3XvDZk7YK5e36qe684COFtzPG6+6P
	yC4OkfNRFsEyvWkSiDSJR/ioUsDmTTGImYHaEYvTre9ifUOjrLNgSpz4/pa
X-Google-Smtp-Source: AGHT+IHE/B4WqDSucCDW9X7EcE+tO5Z1Ume2HgypA2zDwwz21I8HzsyrMatlt9gbMIWpV1hpQEFZnZIcxUktOsV5K+o=
X-Received: by 2002:a17:906:6a23:b0:b04:8d69:6717 with SMTP id
 a640c23a62f3a-b04b16db0cemr1974557066b.43.1757593894420; Thu, 11 Sep 2025
 05:31:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org> <20250911122711.GC8177@pendragon.ideasonboard.com>
In-Reply-To: <20250911122711.GC8177@pendragon.ideasonboard.com>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Thu, 11 Sep 2025 14:31:23 +0200
X-Gm-Features: Ac12FXzsDUMErzpwO2NoZePl_I7-DPlZMSuxk3XN2hllUtRxjI9IAHF7tStaV84
Message-ID: <CACMJSeuq3VrVHNoZ8Usnfkw7bSwF+f6rL1WPz0R4WRnCb6zypQ@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Sept 2025 at 14:27, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> > Just a friendly note, Laurent, I appreciate your work and I do not want
> > to point that you committed it incorrectly. In the contrary - your
> > commit is right, but your upstream maintainer stops you from including
> > this in linux-next. My aim here is only to discuss and improve the process.
>
> I would be happy to have my tree included in linux-next. I'm worried
> that the fact that the media subsystem cherry-picks my pull requests
> instead of merging them would cause issues though. Am I worrying
> needlessly, or is that a real issue ?

Stephen Rothwell will send you automated emails about duplicate
commits being present in linux-next - one coming from your downstream
and one rebased in your upstream maintainer's tree.

Bartosz

