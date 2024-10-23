Return-Path: <ksummit+bounces-1622-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1229AC782
	for <lists@lfdr.de>; Wed, 23 Oct 2024 12:11:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926021F23419
	for <lists@lfdr.de>; Wed, 23 Oct 2024 10:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0481A0AF2;
	Wed, 23 Oct 2024 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RmJdgob8"
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4811A01D8
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729678274; cv=none; b=MggjlKbFncl4pOd2PIab/ldGM4ERCfEBM89phkiMnRKfGoJScA+WsiKL6VvYe2IPpBHl6vzOpyd21NUCCpsJB1eNJ+RJDBC8fzhh1umrxdhUJshxZk+kqlLeRrRHc1P5XLI8Q1T6E03nYg5g/fENEMcB18W4ed8pvHHuYiczQ6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729678274; c=relaxed/simple;
	bh=4xt+M1TKsijkRNzEk6gYKOj8U4y95Ey6HQdeI8L5ZHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1WP2L31D+4Wpgez+iAUSXVbRets+fUswevszttrbol7ZqMF1FoOFm1wuCfXQnNrHSTcP/OTkraPTlq+kYAzOMBC9qVp9jqUxV+LF8QtCA70cGB9iCpXu3zNQ9SqNZSkPsvw/a2wcSJPmWTyIneACi4odvXkUEFUmSA09TfsydE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RmJdgob8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4315baa51d8so66225445e9.0
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729678271; x=1730283071; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sKJHAMKDVpw9bzSHGhrHWmLUI3HVm1NWR3Nb/36MQk8=;
        b=RmJdgob8AcIbjvt1ygE7e1QPNh67+Ao51Ym0WD7x1JrTzILsfnv387D5rhzVK4193q
         QSuluXImamuoUXOtNA5Qbet6H8FSZEGEMWafe/cvsXcAosid+MjEggKFJpc0hXuUA/Fi
         J8iCcUUy6zYtIGdNp030r2khgFkv3LyCJPmstYiCdRYnNZh8wyAe1V9WMgZj4wJYHQc7
         ODPiFPMloi5dcNtEos7nXsU+oBkRvXoATQj+7Pk/VsskiKwfXiY9AsLwlh3/MzufVlju
         uWwuiVxAeg4t7wFJfepmgtU6q0+tgH0eJiNO2nVqmnAppzUaWUCFZ6XxpiGme8ynIIwU
         A+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729678271; x=1730283071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sKJHAMKDVpw9bzSHGhrHWmLUI3HVm1NWR3Nb/36MQk8=;
        b=ppq8MaK+5WtgTd4oum50F4W9POVyfzFPusushjRITnr+2oxiDU0ksuVd9KYvanEroa
         BYZlbCA+VeFsLaAhOZjXHC0/EIBXH3hFtRkE9ECx8XaA1gUcfUCjx7liucrPqvC9S7n1
         J8LKjAS9TTyoITR/3HNuXbOpkLxsx5E8a3f/eiZV5f6764jVisAkl6Z1iomzHbIt33NQ
         yxzpRvivtK+7Z/0+M0eYF3SkonjsZVNH/1vOIyeBSNOG0JlnAPQxLbW7023Wakqe1A5K
         rKrL+NEEthfIfESqNO4eV3r5Wo+7T3tqDwUCkS5iWSHTBIO7DPmk5nYWEIByb4WxFtea
         jqsg==
X-Forwarded-Encrypted: i=1; AJvYcCWXnyLQwLJSpWlATE8YssHK0WIcGy0B+OLIyK4cibCks+wSwH7BaPdULunSqBAaLziUB9ugt5Xy@lists.linux.dev
X-Gm-Message-State: AOJu0YwDS6l+Oa2rOfLSnIDWGl6Sbl3USVCvlgiE5pOdsUdiZtFCNy7c
	5nzKx2CAAPAfD6YItgzdKsFeFRrnXT6um2YmWwZmsYD5iKcpMhvFwPrvy0Dgvoo=
X-Google-Smtp-Source: AGHT+IHFt3z0BuJR9H33ESobunGlzidwzdTNhACnSItxcjBr7HhF+l51ueyKrHzwmqDOM5LvN2Hcxw==
X-Received: by 2002:a05:600c:1d9e:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-431841341d7mr19204965e9.3.1729678270707;
        Wed, 23 Oct 2024 03:11:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c3a707sm12019145e9.33.2024.10.23.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 03:11:10 -0700 (PDT)
Date: Wed, 23 Oct 2024 13:11:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Christoph Hellwig <hch@infradead.org>, Kees Cook <kees@kernel.org>,
	Sasha Levin <sashal@kernel.org>, torvalds@linux-foundation.org,
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: linus-next: improving functional testing for to-be-merged pull
 requests
Message-ID: <2b7d150d-a675-4a35-8f32-75d2da4b3302@stanley.mountain>
References: <ZxZ8MStt4e8JXeJb@sashalap>
 <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org>
 <20241022041243.7f2e53ad@rorschach.local.home>
 <ZxiN3aINYI4u8pRx@infradead.org>
 <20241023042004.405056f5@rorschach.local.home>
 <CAMuHMdUxrULbo=A77DFDE4ySbii3jSMuh8xVvUXaqyCnwEAU-w@mail.gmail.com>
 <20241023051914.7f8cf758@rorschach.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023051914.7f8cf758@rorschach.local.home>

On Wed, Oct 23, 2024 at 05:19:14AM -0400, Steven Rostedt wrote:
> But pushing to linux-next for a day or two, what does that give me?
> 

Two days probably gives you 80% of the testing that people do on linux-next.
I wouldn't run linux-next on real systems but it generally boots and runs LTP
okay these days.

regards,
dan carpenter

