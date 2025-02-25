Return-Path: <ksummit+bounces-1904-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE23A45076
	for <lists@lfdr.de>; Tue, 25 Feb 2025 23:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBAA21898F39
	for <lists@lfdr.de>; Tue, 25 Feb 2025 22:47:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA7C2309A6;
	Tue, 25 Feb 2025 22:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RGJJU2BO"
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CC81624CE
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 22:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740523638; cv=none; b=jHEsT8OsOBUfTKNjiaAZ/HEnqT7W2miaF5VPaCVPByQHQHBlCaz5c+o3anwk4UU5eeuN1gDeD0xlFTBiVCp28zh2ja/uEokNKM4YXMUwBEb0xCfQsjKSgvfUhB3VYJpXZmCS8Ng7C2GwK4keR/d3UPjF9m5NTUCOAChE0ujgP+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740523638; c=relaxed/simple;
	bh=ny2ghrdd8gmVHUJmIR5VEz+T3IjMS6VPe2m4WRZaJOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMR2UwRIxYl+hbWG6xbPFuhso534K185VwUyzODkIOvkZNLxHfchAywnKx5vhNoMBj+j+GmpvVxGMX6m6DBEcLwYnvfGsGsM96/Xh6yfOGm4yjM939ahollZBRyZkpm8kS4fNxVRWdHKxEBoSfFiwWiiSaoWyBr1QpqazZuwTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RGJJU2BO; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2f74e6c6cbcso1620469a91.2
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 14:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740523636; x=1741128436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ny2ghrdd8gmVHUJmIR5VEz+T3IjMS6VPe2m4WRZaJOs=;
        b=RGJJU2BOKVh1zZuQR3INa+sQPV+SZo6qoucRrmBh8gGTjbAzLhzWlf+H84T7u11LDd
         rhpS/bGMEycOPr8V5wwBAFrYqc9HNNWpkfobZLiBzcFjG8HZoN4gMb7C4qijbYwimX1h
         H0vPbI4+vvCdjyW2zJr/5YRlfAZ2hi7HZWDBsuZbomxUHRbKku+kOWZRQ4TssYy12Okd
         XV3yk76stIMnEWlyQkHaqUe66JvsVsmOXPbseeUFdZvu9FzNiJgYWT9OzevHKcih+aGH
         mJP+ni2NdId3cGY9FylhCd4RflZU64hQiqRGEtEQHOEvPD2MNPp+rL4qUCmG1N27s1di
         lUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523636; x=1741128436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ny2ghrdd8gmVHUJmIR5VEz+T3IjMS6VPe2m4WRZaJOs=;
        b=MOTVIovzWUQGfELGts+/PORQxo4x4y1HzWmBV6K5lC0+MT6h97W8aMMAVFj78WLW63
         shukhvtt1CegO/hskz2Y/FtKal/UhmK1onj3vYE46IK3FSoC/voXnd3B214Wp6xYKsCm
         B71tk78oKvMmMomYiJrcE/slhIQpnAeFmA3+N00Z1mF+l2zif5liFKbCSSuw/JiVtnR4
         wW6b9R80HBuawyLBDaG72adAAjRtuJM39GnQRlX8nv4fL2z6cpBVm70vKjXoRk0VfWRL
         /ZMj4nYEiGrA6WNJ2OUg0qY84u+cSKsuNvajlYpRvq3Ntq7xYUUEHQBGEMuQE6CJRLs9
         0D6A==
X-Forwarded-Encrypted: i=1; AJvYcCUz4Z5elz1Qzs1WlGen2J2siIfaFSx5or+xOS7tz6z8wY2Wx0TeLy2JppgUQe0U8tSgmYLbQVL7@lists.linux.dev
X-Gm-Message-State: AOJu0YybYh9asZ5saunp9R7zDWFCA4a0cTJgyV8itFcq0jKFyTLaz/YR
	J8uxaDl10HpIuEhjTKsuA7AItaSznC0njMmwy6ZeXbMMX9Kx4mewd8Z4i/gcjksKlG2rdZKNSr0
	sTJlWrBkJn7s/7zUHVcygiUNnt0Y=
X-Gm-Gg: ASbGncvrj3vXoNkrZzu8JAKJdmWOHX6PzBuVohEXMsRqh5GfEMnled42dTcXHTrTfqF
	Y1KoW2QxP1y/gCnFDsuF8l1hsgt/PYtlRK1a2eTLYJmSPoyhCY/LOeA6XHyosYIsJD0rk/UKkuk
	MLZnY5V7A=
X-Google-Smtp-Source: AGHT+IGi39MZWp1FrqUalH4zLCzJZyUAjKjFfaYDXFXZ7HT8JiWDotjXJ+45bzkp2240ucesaig3+7yZTGxqAKsS4SI=
X-Received: by 2002:a17:90b:3848:b0:2ee:acea:9ec4 with SMTP id
 98e67ed59e1d1-2fce7af8da8mr11771572a91.3.1740523636156; Tue, 25 Feb 2025
 14:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250224002745.7d7460a7.gary@garyguo.net> <CAFJgqgSNjF=LfrCNTH3GdYssXz9YG-AeCtpibejJ7Ywtx0m3HQ@mail.gmail.com>
 <4cb1d98b-f94b-410a-be90-4394c48bdbf2@proton.me> <CAFJgqgQ3P81-iskGu9R+T=c=wyB2K0JqUhx+Gj+6mkYeY8-ORg@mail.gmail.com>
 <a4b79751-f1c8-4476-98a5-c59fb2e545ad@proton.me> <CAFJgqgRdiQ29bWvwsu11yokZb4OFF7pYYUU=ES6CYv9847KgVg@mail.gmail.com>
 <c05cb400-969d-44a1-bd40-9b799ed894d7@proton.me> <CAFJgqgTs3h5YagY1RU2AZf3wKWKfXiPTE2mx7CuWyzN=ee-k3g@mail.gmail.com>
 <137dd7ef-b8f6-43df-87e0-115f913d0465@proton.me>
In-Reply-To: <137dd7ef-b8f6-43df-87e0-115f913d0465@proton.me>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Feb 2025 23:47:03 +0100
X-Gm-Features: AQ5f1JpvOh4_I-FDP0Z4g4cSDvvRBjbQMQSAXGa5UM-gHOivr4L6ainO45xfxNY
Message-ID: <CANiq72=L4AHq0dNYV-KBsYy_TJwfDRwR+GTJn81EXs=xefvdsQ@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Benno Lossin <benno.lossin@proton.me>
Cc: Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	airlied@gmail.com, boqun.feng@gmail.com, david.laight.linux@gmail.com, 
	ej@inai.de, gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 11:38=E2=80=AFPM Benno Lossin <benno.lossin@proton.=
me> wrote:
>
> I do not get UB when I comment out any of the commented lines. Can you
> share the output of MIRI?

I think he means when only having one of the `pz`s definitions out of
the 4, i.e. uncommenting the first and commenting the last one that is
live in the example.

Cheers,
Miguel

