Return-Path: <ksummit+bounces-1629-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9C39AD3A0
	for <lists@lfdr.de>; Wed, 23 Oct 2024 20:10:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F794285153
	for <lists@lfdr.de>; Wed, 23 Oct 2024 18:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4601D04BB;
	Wed, 23 Oct 2024 18:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="BSGQtexA"
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC0B1CBE9A
	for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707006; cv=none; b=VK6P2b7WGCsqACKjYplBEbeCTFmFglNah6bEJVciA2B6KRzfxFUz8KXVtfGddCua4gALHv+wGsQvt/cIdZzycxFg5JnqKIO4HqhKbPFeLpcfIYcpsAnXFC2toO68pm46CSRqxjKnLLT0xfUtr6HjJbiaNuV6SGL47IIcX4XDMAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707006; c=relaxed/simple;
	bh=lE42JIL6vSpDwSorqaxpEBJHVYXGViylruSIlLVPi3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQJUZ53F4STJr+6PpD6lkWw+Uick5KXrLNSRomTbR4i6cWUQa8l/DJdSmjT9KD2t/C6NLIQqu/T2XXAOu9ewSmFrKHjr/Ow6+sD2hQZiCti/mNtLLbB7oeoX9cAZrokYdd5HNZiuS49iTRakY8tk95bTlOf7mmhfEmg4KTjryFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=BSGQtexA; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso292871fa.3
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 11:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729707003; x=1730311803; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UbORvIuwugQ76782JL8neziFCEgBQQicaiJEnwAdmX0=;
        b=BSGQtexApNuYtMMvOwAWotqL9A6HyBp2nYrVr7fRcSo1DZocB7ZWUu8nHYJIhCcSbY
         6IcgyTJiyiWiBRPI3rkQcxcS5xWE0xwcG3xqVY31izmCQ/g3pPHe1Z0t3snplEylspDy
         2aGMZryr7hdCJOe+Mn9/loXcoPoIw0cXO7wgs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729707003; x=1730311803;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UbORvIuwugQ76782JL8neziFCEgBQQicaiJEnwAdmX0=;
        b=ItnhusPk/DZXMqwEsIm7Lit3Z6D8j0x03eweVuXw+GtDxEtsnnG4/lZVgSNGZL7BhS
         qb5wEnQxVHAvejKyR0GtMRQkmJk59G3cGeB7GFzrPdCAegSlnollXFxH1VEE6NhwlIi4
         YuXSYpZB2mdparMqILzAzL47GXHeJfVm6o+HwGa/57TwthfTs4FLEWbsopE6zXzFBUAj
         mgEoHnXZHlfn1CFaizuS6bAcgsWKKWc4h7JJdoUR7Ed0vXi59WSo9j23fkVuEwUI9w+t
         R7B/Lmw6o5k2g56Ci9kRaKuxrp8mLwP4jRQ1sU1sKRF2zeZvP07E0JHLM0Qd6piQMjm/
         bt7w==
X-Forwarded-Encrypted: i=1; AJvYcCWJkBUfaVyaYzc+kK2ylQ5x3W3jnCPFxutRpBhlljI+QXwteRpzX+zPrfEWmcd3Nqx+yXrsnbaZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwDIQAJia5eiJW+pQZIelSPXwhYYYZDGnBp7O/knWmpvYVjFfyH
	yhm+Gw2M5szL8pESMu62ZOcgf701nXm7fHRTnm4Z92ieY+GcxB+pXlI9auzI3dsqaKnaC0EF2Kv
	OoMGcxA==
X-Google-Smtp-Source: AGHT+IFjN66vsHpgBf0W5ppf+sjaizUJsh9l7iQVwIsS8+29KXwR0RvRszlevLobO8ajhUbNEFEXZA==
X-Received: by 2002:a2e:4601:0:b0:2f7:6653:8053 with SMTP id 38308e7fff4ca-2fc9d32f74emr24934921fa.18.1729707002633;
        Wed, 23 Oct 2024 11:10:02 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb9ae11b70sm11059361fa.104.2024.10.23.11.10.01
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 11:10:01 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso292401fa.3
        for <ksummit@lists.linux.dev>; Wed, 23 Oct 2024 11:10:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxmlUv4i1RlfmyC8QJPOJBQ0niY4SS1Y7hNJ6aQ+hurkP6JRdspq141q76erN3iOoey5tG1MAq@lists.linux.dev
X-Received: by 2002:a2e:a991:0:b0:2fa:c5d9:105b with SMTP id
 38308e7fff4ca-2fc9d2e53c7mr35431771fa.2.1729707000802; Wed, 23 Oct 2024
 11:10:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZxZ8MStt4e8JXeJb@sashalap> <792F4759-EA33-48B8-9AD0-FA14FA69E86E@kernel.org>
 <ZxdKwtTd7LvpieLK@infradead.org> <ZxdyYjzxSktk34Zz@sashalap>
 <ZxiOjBRdO6EMAY4H@infradead.org> <10b0cb74-2068-4819-ac91-fcf98ca8d96c@paulmck-laptop>
 <61e62ab7-50d4-40a3-8230-9c5e6814829a@roeck-us.net>
In-Reply-To: <61e62ab7-50d4-40a3-8230-9c5e6814829a@roeck-us.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 11:09:44 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh1j+yj6X9vaj6i+oy+CtwnUvK+2J9LkheLjHtKAFYrjg@mail.gmail.com>
Message-ID: <CAHk-=wh1j+yj6X9vaj6i+oy+CtwnUvK+2J9LkheLjHtKAFYrjg@mail.gmail.com>
Subject: Re: linus-next: improving functional testing for to-be-merged pull requests
To: Guenter Roeck <linux@roeck-us.net>
Cc: paulmck@kernel.org, Christoph Hellwig <hch@infradead.org>, Sasha Levin <sashal@kernel.org>, 
	Kees Cook <kees@kernel.org>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 11:05, Guenter Roeck <linux@roeck-us.net> wrote:
>
> And that is a good day. Sometimes dozens of builds and hundreds
> of boot tests fail. Analyzing those failures would be a full-time job.
> Who do you expect would or should do that ?

Yeah, this is the problem. I think it's only useful if some automation
(not humans! That would make people burn out immediately) can actually
pinpoint the trees that introduced the failures.

And I think that would be absolutely lovely. But I suspect the testing
requirements then have latencies long enough that getting to that
point might not be entirely realistic.

              Linus

