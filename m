Return-Path: <ksummit+bounces-2535-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60AD8BE057E
	for <lists@lfdr.de>; Wed, 15 Oct 2025 21:17:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD4653B3246
	for <lists@lfdr.de>; Wed, 15 Oct 2025 19:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5692C236F;
	Wed, 15 Oct 2025 19:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="esDqcjBS"
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125011624D5
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 19:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760555871; cv=none; b=aLUwOeWypBm6+7FmAE1M96XsQruhrmiq7MG1tkYPihGqOqU+KRP0Pa0SxDNMeXPNk1Ii3vD739AQmOOcSp0axhFur++szDhhLLChvbKGRUmF3wOerKQN8bxALoK5ZLIcN4ZVOGYZWkU3i2VBhsUehC0ajzsy3oZfd9//DbDSq68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760555871; c=relaxed/simple;
	bh=AlkB23vpWLmbOMISmOxoFJm8UABdsjFykBHNKHnjbRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuRro7l1ZveiFMr6WE6taxAoMNAtRE0BZ2Gp+N+oYtOFZq7VhBKkyoSoZ/3DV4m/tCFOIQMef/Nnd7t6Rxw3EFP0O9BalWMSBDUUJlsF0gegXXyX34qDXDxZLX5JcrT/bZM8ibWTmlwuS6hbHacyHtYn0KQ6EsbQRz6ViZ5HVs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=esDqcjBS; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-639e1e8c8c8so13496522a12.1
        for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 12:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1760555867; x=1761160667; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Jmi6bo/1/F2fXJ8Oh5RrF1NvM5QxaGfBjBnk20MiEao=;
        b=esDqcjBSGlMpdeQP04LA2MRVUOdu5RqOEGNHhTZZuw9KCNOvz5OIQ9YWCAnBzbmnPX
         aOVyg0wf15KMQn4uzDVChCfEG7SuiBYJvv4v5FZe7xAgM1t1FbHJj9uFuvhQw2XTcjAT
         4h/ULX27//9mV6hKbxZUTBEfN9GE+f5lXpqk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760555867; x=1761160667;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jmi6bo/1/F2fXJ8Oh5RrF1NvM5QxaGfBjBnk20MiEao=;
        b=gdQZG8QDiI6J+8IqClc7bXTVyY9N37tsJXB/tlgV4CKt84yElKDiLlahHwa0LNv6ii
         VBK//Lz6BaagniRE2zljPX26zh2ojMH5Y8B1hWqe9vFqiTqNl5SJvnMGquBN0uk9jC7f
         VlXBsucH8TeOv+bq5aCifDQBSgD2atxIM4RlBhUeIQGTjyKWj/nUf7LRcVh/RhRJ39TX
         D2J070NYbBdy9mjvbbXN3whjlrkma6BCUviCvJKEbZCEOfwVhBdjgyKuIpxwQC2HHDjp
         cu6BzmTB8NyMfHUU+dFNHGC/jrbMmFrOOqiBp0MXEHAEboJVwDA720E1cBhrq6pMgYHW
         w8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCV71Bf2yuNTJDmgEERkurDYjt0CpUfeKANlcChfIm6cOmOxyOrffmJ6J6K43m2VQ6FAkDdNZosq@lists.linux.dev
X-Gm-Message-State: AOJu0YxYgVdOix5TvexEPaSj3NRtiCMHs1/mXHZ4XiJFDrKAFN8BYMmt
	Z4lxCs2Cbk69gfxxFxgbR5qe5LAYvOWOsDjqy2Q7JItN3sQ1lUNBssWsHH00nZM7uDzNzFwchzc
	wrK4aN+8=
X-Gm-Gg: ASbGncsuODkK0nd29FX40Gj9iFqmBYCdB9ATpEjSFEhIT11FL5ZLLjoccYns+ppolJE
	u1xUJIZsTVpgIjaADxyD+0JWmGuAZMx2QiHCE0XD8B1a7MHGQ5df8TOELXJPQocr01dwTegiJdG
	vfVsJE+qHuMxQ35+fXS3JWq0Kn1wuRQmFS7JZGpPfFSjwmEpuVmbZ80j9EcKylf9GUS372RnwM+
	/3T1BMjQURtuLIewpcjnfUwVpbrSiSluEh1VV56Xve3QMDIeS0q78YZ76e0tBxm/rrEPLltRauU
	lntY2Tq0mG7ufq1jXy9+Fzzd9Bb7KgjBt8grU7pNHrqmHa2qbzNH7Mvxh7wI3p+hPodMK/MSBDq
	5rGMlJ9UvD2Sz393lB0DA1MeijbMUOyfVVfhKZ99LKesIu+n6TvWZBU4scnDuAL4JEun5gUx0w9
	tU6UntDm0HEzVLzjHHaYacOxeHHQ==
X-Google-Smtp-Source: AGHT+IGCFMra09ZbD+qc+xZ+WaWvtwPFCBHlfG9Hi8JyN/UQE+u/aC6bDcZehh2yArJFkSeIArD2sw==
X-Received: by 2002:a05:6402:5193:b0:634:c1a5:3106 with SMTP id 4fb4d7f45d1cf-639d5c5a3dfmr26956854a12.31.1760555867086;
        Wed, 15 Oct 2025 12:17:47 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235dca9sm14247105a12.8.2025.10.15.12.17.45
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:17:46 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6318855a83fso15452471a12.2
        for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 12:17:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVulpbdb+asPsH9L1//lW+8/rKD3xIlC71+sC4DJn3R5eZXyGRFGnEmfY5RbgasJE7RivWdFIHk@lists.linux.dev
X-Received: by 2002:a05:6402:13d1:b0:634:ab80:d84b with SMTP id
 4fb4d7f45d1cf-639d5c5a3f8mr27931232a12.32.1760555865233; Wed, 15 Oct 2025
 12:17:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch> <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch> <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
In-Reply-To: <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Oct 2025 12:17:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
X-Gm-Features: AS18NWDwLReKVPkF66n-GRSk1sH61dBYgbDyFCakBQ9OM6Wtopttyg1iIeDT9vg
Message-ID: <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: dan.j.williams@intel.com, Greg KH <gregkh@linuxfoundation.org>, 
	Doug Anderson <dianders@chromium.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Oct 2025 at 12:15, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> (The above script is "tested" in that I verified that yes

.. premature 'hit send' situation. That should have said

 ..that yes] I verified that it superficially works, but didn't do
anything exhaustive.

It was obviously meant as a "look, you can do things like this", not
as a real fully fleshed out solution.

           Linus

