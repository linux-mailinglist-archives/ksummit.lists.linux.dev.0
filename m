Return-Path: <ksummit+bounces-2778-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 688C1D38FC4
	for <lists@lfdr.de>; Sat, 17 Jan 2026 17:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9FED300B025
	for <lists@lfdr.de>; Sat, 17 Jan 2026 16:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A307E242D8B;
	Sat, 17 Jan 2026 16:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmTCDnTy"
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B284620DD51
	for <ksummit@lists.linux.dev>; Sat, 17 Jan 2026 16:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768666952; cv=none; b=EOqHkZp1FbHysnl1B8GKVvTEO6dwqvLShM74OyauLNpJ/Pi6rCrY92+NEG0p2a8HUisGFuGKkoC4nNjuzpVqCQOwYcmXO1BU2zJ0jPdK2g2MUjOTXr14A27v1Vje1rUQ9yW1ihvulzxH1gm/RLWQFsU1m/F6unHWbTHtPsIuMvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768666952; c=relaxed/simple;
	bh=+FVsw8KzpQH6nfffdWqTUFB3GfGXZRwfpTS005fYALc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DUdJXkuN4fxVMHxiOaWal5QSjGQ9VvXHy6rVTE7XSX89KWeFEH3GA07Qf0ckA7SHC0BeeFqzMVhCH4/mGUUgt7c2LNSD2jEw1OBH/t/5/VA9wOtdFjgJP6jytjIc2U1AZMmWL9QzYZQy5wMEuVYRauSJyZaiVNngDg5NhWqQol8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmTCDnTy; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b7bb3b913so3645649e87.1
        for <ksummit@lists.linux.dev>; Sat, 17 Jan 2026 08:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768666949; x=1769271749; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fD7I4cqCaVfdNnoOIWv+TAA/Gm+E0UqjGqj/Sz/RI1o=;
        b=bmTCDnTy19UcI0HzudmNfHW2sU/MfzM8jIwSz7RBumWM/vPp0nrjepZWwqjNAHlVs6
         51GbVhniUkR7e/W7W1nUfY7E3NARbbmh+7GkHXfapAxd5N+wWMu5ACnDxJhRVzpbtyA5
         mgyc16szebbsdSzOHuZSgXYotJxYYt5Chiq9YJqu4d5M1TVCBWl3BIQ8gRZfTurQROEv
         HqBOpdPrEwPk0knY9RPxMwnEB7j3CKgb5FeA0q1oB/zm8lgi0FJuVrx4ynQ//eCuwYtD
         qGgmK8Q7qCEHr/v+oN9BgYvsKxR4xDUo0HvHYyQ0iMlUU2etEhGEVGjZfj8HA4Mt7mKH
         B4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768666949; x=1769271749;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fD7I4cqCaVfdNnoOIWv+TAA/Gm+E0UqjGqj/Sz/RI1o=;
        b=qF+QBUKUTVTHmIfw9qh5fTToxnUHlUs9PTV9yRAx/3Gm/uQI5JRJSk30965ASrc2Zb
         17MjhyZsklA9ZG3v7Lj5obcM0lxSF6hJ8icDXGqd7kZO18kT7qGCCis9oxEFj/4gkfyX
         qXVLmJLvcZNCj/M331FyTW4OYDbZA35q4bWRYQJhUraaJC1iyp9yk2RQqGFGurRToxUq
         +JIX30Kzf8tgE2911MKFM6fFmlgUeM8zOSd+fzRkw3+d4uRflpKWntxiAUEMbL8J/EDc
         7fWoDh+92E92Eir+3yUMVrSh7e4LG+Q7gUYIQuzs2EeTF7IQvfEqwm1yExErR9teEcYL
         +goQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9Qn4K5D5kF2zCzIcEQ/EFg7m+09WvYVNpUH7Puz5sduWEcEfZ9JrgRtsnfsxYlCi1c9YUeKPm@lists.linux.dev
X-Gm-Message-State: AOJu0YyKo/J0tqLCGWJNXv+jR6gcUYd7mmnzI12K3/E5H6ZH8SdFEiHy
	wXAVKDRSUJE7jN65bRYP7BL5Bge15gPNMvGRlTDonwY24SgmGxiigf4=
X-Gm-Gg: AY/fxX5/2EDOsJn4PNDhQ2VzuoWQZyneeYLt2ZOgOWpKBExmyNemfMl+udqjm26fzYW
	QI8Of7tZdqz1XXgnR9XZOk8HZpOQLoNy5qYsXGd2YiO5obcxqNnb//KhTP7Hnf+e/tt5VF97oM8
	tDzcacZmNCC8MLl70xp4FGRF9OeYWfY32HVNKJV9aSwWrwlmwRkajGGDFNz1OCBYZLztkxOq+CX
	/BENyFC1niYhfTbmQS6Av3bBeoZMvjX/X87Qx+QThvaOcqD7S4eJHZZHeDIroa267urMeK7zxFN
	e4kSRb39ums0mVMDTSUuc5dKejFqzv+rUjsHRPegTWc+uHVkD1i8aMWuH6airOWfD9393Qm/CfX
	tDhda4cRvYCN4WOJPzCHUsvG7lx0fqc9zrp1GkmNZ4fwXeyJBoXdNjoRv/WIeFgVrKKY9ckxasp
	wQcj3CoGQbO38=
X-Received: by 2002:a05:6512:2392:b0:59b:b2f0:d2e0 with SMTP id 2adb3069b0e04-59bb2f0d3c1mr1770306e87.13.1768666948585;
        Sat, 17 Jan 2026 08:22:28 -0800 (PST)
Received: from p183 ([178.172.147.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf3544c0sm1725662e87.44.2026.01.17.08.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 08:22:27 -0800 (PST)
Date: Sat, 17 Jan 2026 19:23:07 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <38d7b19f-b6ff-437b-bc88-fa2047ca556a@p183>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <7b37e1cb-271e-49fe-a3ee-5443006284e1@p183>
 <aVUUXAKjiNroU5tR@black.igk.intel.com>
 <20260102095029.03481f90@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260102095029.03481f90@gandalf.local.home>

On Fri, Jan 02, 2026 at 09:50:29AM -0500, Steven Rostedt wrote:
> On Wed, 31 Dec 2025 13:17:32 +0100
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > > There was variation of this type of nonsense with headers (not only it has
> > > to be sorted alphabetically but by length too!)  
> > 
> > By length it indeed sounds weird, but alphabetical is the natural language
> > order everybody learnt from the daycare / school years, so it's properly
> > programmed in our deep brain. Having that allows to find easily if anything one
> > is interested in is already being included. Also it allows to avoid dup inclusions
> > (was there, fixed that for real). So, it's not bad.
> 
> Actually, I like the "by length" because its aesthetically easier on the eyes.
> 
> Alphabetically is fine, but either one helps in catching duplicate headers.

Such rules for headers are mostly harmless -- headers are supposed to be
idempotent so ordering doesn't matter. But if ordering doesn't matter
why have a rule at all?

Duplicate header are trivially caught by tooling.

But such rules aren't useful either -- I've seen that Python IDEs hide
import list by default (and probably manage it) because it is not "real"
code.

Rules for initializers can be harmful because ordering affects code
generation.

