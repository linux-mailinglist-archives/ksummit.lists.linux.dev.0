Return-Path: <ksummit+bounces-2625-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4244EC6B632
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 914F529257
	for <lists@lfdr.de>; Tue, 18 Nov 2025 19:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406F721885A;
	Tue, 18 Nov 2025 19:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="JcuTJVeQ"
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E112DCF72
	for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 19:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763493284; cv=none; b=gQdzLBYRtQjkwdxqqj8U6wT740F8rYnTHYlBVcVZQDkwJQG/6+LF6fHaenB4aogj80K17fdwB5PhTHTsUFLABuTrpsnvPhBAMeBAHi9+jw7cj4XzWQ37jONYce+vpE/M2F1WV4dgEvP2lX0qQwq5CMs3nSzXju57Zw/Jt64/lK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763493284; c=relaxed/simple;
	bh=vnC+t2uolRGR/UBJjTGuGQf//o1PmZCS46TqGZkaTY8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nxTR0VPt3YOSsenk78dG7hNnUNEPs/EyF7MZ2nwjkb1pA2C0ybKPN6yzsx4cFyNM4ESw4rmDyHVyfgjAmsXtIluJW6YBibKoglm+h8mlbQXMG9cYPo5yrkaB/qhF94eRYUDTvOj0HtfZm+AJFris1G1ml5dhw+l0fyk5o9MF9oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=JcuTJVeQ; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6418738efa0so10343775a12.1
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 11:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1763493280; x=1764098080; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wx8vsRk+uX8K+R287yzNpgneuVIOqbxgMdZG/uaWBLU=;
        b=JcuTJVeQoAeUb2e6HEtK8AdpYxuUkqij1K+mER+ex1T3tIi9YPTiWoGGdkvHr5faAP
         jATeWCAC0CF7pSiHEeJ5ox4QZzbI7mJIEpUt7IzEbtiLLtwyBG/U7NpXjFUmrEhvrYp+
         fydSKR1T7iq8WkIZB27r6YNBXVM+qhdtXEiFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763493280; x=1764098080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wx8vsRk+uX8K+R287yzNpgneuVIOqbxgMdZG/uaWBLU=;
        b=dN1Rp5onDXFzNw6vDaj65OU8YmcO4petH1AlUfPeavTfUSu3fcguY5/nxhUAUjNlv9
         UIej8Z0Pf+lLQo4QBYAJ1ICzBysHlmeZdckExdqthtQkq3phX5prevTBn5jDxKGilWTe
         izdw5Hn1IGN0DkGw59R5n4+5zJbW8IFlLPhS2IaK/MpirgQZ4CmKzn/qUCGeRUffvU28
         3Y8FHYZkSsR7yHDiKYmZk0ASEX6KQnjs7vjV9U4ymyFoIzfVE3hpEmDqCVPpUwmgE46j
         AsNcONrriPtY1jgaMEdIH4Bk6mUQCEB/il4GytrgJ9VwRsRmHJdAC6KEnNwUnV4FuI6k
         Kl5w==
X-Forwarded-Encrypted: i=1; AJvYcCWKhgz5KgupcZLxYkik55XtEKdDKe5NnJlhI9+rJL6w1yIy3dCJhB6+hPTTRycbXCPDQ+ohacJq@lists.linux.dev
X-Gm-Message-State: AOJu0YypALTWUZA8GybT5m01L3Lc9PXsDIX3yhIIgvJGKCqYLPR6vxmz
	InREnF6spWPA7ANJc+PjtvOZwQkwf3KN6SO0knjwT85+uzNa8H0VfVYf6OwYe8xmaXX3rychFyh
	WLRAzlKo=
X-Gm-Gg: ASbGncvU3SEvyRMZJNHdp7lDu25RNT3qQ4PDcAjo4MJ60O1Oeeh4dYkfPmKIPUyYHxH
	FefZv4J2pVK4iw3WaEQJpXHPxNbqbDoqkpEYgc+cwzBCjRxVvh68cGAdlmMyW8UP73BiMqEbGKT
	Pof7pesyHdPm3hfe5Tqn4wbzEVMbnZ+ORDF2PMfUXFKZrjSt1/9vbPjlCXqCrJQGVuzbyiz2yGE
	WZ3kvYhE1hvuSFx4eTdBjxklm5InqxIrCvBHUAmj+jrvQcSLT3i5/574JZd4Wjikn2SVf2wyuVG
	czafRr6fUMWaFfTLqziA3yETciOcM9coTSu8Hrr7eSTWR07g9w+b/nm9W5nEpJ+8FUjG9RrBi4H
	shTn92b5URA2AX9nYsD5L+0OJthqbhZ3Orrz8t3XuHQ8f4A90yV5jPofneALewT5aJ75ExZuU/E
	rpXSgFZ8TrXg2/8BX4lwiWSTggttfeO/9JwPR+YbMLsurv+YqUJ4L13RCtTLixjxzSecTmbSQ3I
	NVev/UXpA==
X-Google-Smtp-Source: AGHT+IHa3ylb7pDKeY20HBBjWXOa2tDDa5DJvugXgQy5r6dCJkHCJrSyzSaeoqDq8qMUi5YUHqbPxg==
X-Received: by 2002:a05:6402:50c8:b0:641:2cf3:ec3e with SMTP id 4fb4d7f45d1cf-64350e05276mr16154327a12.11.1763493279620;
        Tue, 18 Nov 2025 11:14:39 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b1db6sm13368723a12.26.2025.11.18.11.14.38
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 11:14:38 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b737cd03d46so505649666b.0
        for <ksummit@lists.linux.dev>; Tue, 18 Nov 2025 11:14:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXLmvH2NcEw1qCmM3uKlEGp66qwOiVjk05N8iF5xBJs94tzVkm/qPiOpT45caoIS2I33QZhOypn@lists.linux.dev
X-Received: by 2002:a17:906:c153:b0:b72:6a39:49d7 with SMTP id
 a640c23a62f3a-b7367b8ddf7mr1817404166b.33.1763493278245; Tue, 18 Nov 2025
 11:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org> <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <82a250e0-de9e-467a-882e-7acefbfd7c24@acm.org>
In-Reply-To: <82a250e0-de9e-467a-882e-7acefbfd7c24@acm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Nov 2025 11:14:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wh3pguds+vjKy81X2o0uJj+AhwpMu2=mf6jciQjEQ781Q@mail.gmail.com>
X-Gm-Features: AWmQ_bnMET495X1FYxhOeTOBWSLBzAetI1aw9hBAaEilWmpM5e-FxebKCPA9zz0
Message-ID: <CAHk-=wh3pguds+vjKy81X2o0uJj+AhwpMu2=mf6jciQjEQ781Q@mail.gmail.com>
Subject: Re: Clarifying confusion of our variable placement rules caused by cleanup.h
To: Bart Van Assche <bvanassche@acm.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev, 
	Dan Williams <dan.j.williams@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Nov 2025 at 11:05, Bart Van Assche <bvanassche@acm.org> wrote:
>
> In a C++ style guide I found the following advice for type deduction:
>
> "Use type deduction only if it makes the code clearer to readers who
> aren't familiar with the project, or if it makes the code safer. Do not
> use it merely to avoid the inconvenience of writing an explicit type."

I don't think that's a bad rule, no. I don't think we should encourage
people to switch to automatic types just because they can, but I do
think there are situations where it makes sense and makes the code
simpler.

As mentioned, most of our automatic types currently are hidden in
helper macros. I think it typically works best in those, where you
effectively make them type-agnostic.

But I do think it also makes sense in various allocation scenarios,
where just repeating the same type multiple times adds no real upside.

It's not exactly uncommon to have code like this:

    struct xyz *abc = kzalloc(sizeof(struct xyz), GPF_KERNEL);

and I don't think there's any actual *value* in stating that "struct
xyz" twice (or in stating the sizeof()).

Again: I don't think we should  *push* people to do this, but I think
it's a reasonable thing to allow. And it's a situation where having
the declaration in the middle of the code really does make sense.

                  Linus

