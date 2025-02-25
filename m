Return-Path: <ksummit+bounces-1902-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FCCA4506A
	for <lists@lfdr.de>; Tue, 25 Feb 2025 23:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EA9E1891E65
	for <lists@lfdr.de>; Tue, 25 Feb 2025 22:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5510722256B;
	Tue, 25 Feb 2025 22:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BcY/VBAo"
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457AA2222DE
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740523389; cv=none; b=CQNaL2jWGgaJ93KYKQFckfRBNwqT4StHpPe29BfZcWs7SNKZpb0Uk7ALA3u8cThvm/45NguIfEXrRRcxWzW/JNWWiQ092KQA7RtfHMIoeNRfa+QL0lKt3FYvADit9f2H+rqa0lV3Y2jM8O2tT2Jvzn1cYSkdZ5s/T6fM7szfT28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740523389; c=relaxed/simple;
	bh=t2y+1hyLZ9tCfpnu5MkiJTZ0i7gEN7OmTpDXZK1o+Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qD2eWb/r0qyR9Wy2eVjaeuMcejTLjeH0furgyXlPH4EMyQTCmfOiPQxg3+yP3x+308VJf3WvI5ry175YGEVwxSmWBXNdEvjzOrjq6FytLKfCup6U0tIndyBx4pRxclqVhOV9/bIB7ifFP+CEe+duSKu7f0+rgFGtNahOBE4xnjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BcY/VBAo; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30a2e23efd6so4568641fa.1
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 14:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740523386; x=1741128186; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Yga5K/x6Wl6/t8h2fecPgE6qaCtJyQQ9C0xTTZzLcA=;
        b=BcY/VBAoSEyeEhB8AM+CbzVnvvEkwYQ+9yvYWZj0/E3kKYW1GWYwa+nZeOYAy2BqQx
         QW1EliSvi7Pw4k5CQTQJRwup61GyI2ZuDGyHCB8lcQQSsOuH4a+KcyI2I/wh9cdD8pC8
         mDM1cqDxj32sQ89CxZPd6gGaFXR/RpF0xvuIcAMFrBDnecce1cO8RuhFGK5NLuWjYt2T
         CEjJcNcihRa1u2b2p4prKxmPHS0RE9yMLtQrWjKjxqg0/JwfcLNYG8EDKh/OtiszJkuQ
         CUhdBQcatjqmCGjwmJw5YXN2D4S1hZHuK72/hf0UZGpBNct18jyzQTmRYptSedBTbtJ5
         QA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740523386; x=1741128186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Yga5K/x6Wl6/t8h2fecPgE6qaCtJyQQ9C0xTTZzLcA=;
        b=GGnYbgKRdIvt9BYAwBjpzXTLiZCeTydvZKuXVSk9B72aPR8Hi/jGWOVmVJuk1EBnel
         WA/hTNSoHqNMf8dXRy77/bhgcAMwkYcqSf5NmhOU//3XIChWBRwKri2l1EmNhcVqWbxf
         cyvW9SShqXa+g9TIaxpXqfCCJGkMIXUBCUB4LRTLjxqywHkBhR30q5IdlqqMeaSVWw17
         Q0v4ngHnWV/ka/eV/8taUCeneRJud1mcvaj9oDouacRzHxE/v30EjG+tD8YTUsLGqmCH
         l1aTLlCbgbUK+7ZruWv/ITLw1Hq1vyc2CnVw3dkX438SRB8l+w8gyXYH6C3nOiwMOMPP
         SoRA==
X-Forwarded-Encrypted: i=1; AJvYcCVv8GwtPQ5KQOwcFb5I/0/WDI0BVXOLK642xr7boqFhiKC9BWeuI85coVUbxZJAJJSpS/7RpJ6Z@lists.linux.dev
X-Gm-Message-State: AOJu0YzFjDKlLATHPlj5R3X8zndyst+pjXAUzXS2YK1+ozfIVq7WufR+
	Hfioy6u2i+hFIV8vzXggOu/KWEqmmzzFjKHagWBTEAnM4bcP8PkM9UOurFaJaUpU93YQnHi19Vk
	CAWMe/Y5MpfvWUGnd0S/b14RiXgE=
X-Gm-Gg: ASbGncsTpEtLq5LnjLRGlcQWgUzFk6DgVamf7Sd5Xpd9nnuJyvIs4nKrB5O8MQ3J9xw
	YEorNdzHs2mf0D21R3Ngvn8EKHkqRLymc9FZLwmDhlAdr9XpxwUeyp0l+LY28CriBijCODorQUF
	dLKgpK6sc=
X-Google-Smtp-Source: AGHT+IH/KKQWDeEI5zLaYzjMloaCm9aig6LY9VFFxT2Lj+vROONYUCNWMwM7XEj/ITbW4w1Lc6MlqvDYNKFyUzA7glU=
X-Received: by 2002:a2e:bd06:0:b0:308:e54d:61a9 with SMTP id
 38308e7fff4ca-30a599bd6c1mr33802571fa.10.1740523386027; Tue, 25 Feb 2025
 14:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo> <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com> <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
In-Reply-To: <gqw7cvclnfa7x4xdz4vkns2msf2bqrms5ecxp2lwzbws7ab6dt@7zbli7qwiiz6>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 25 Feb 2025 23:42:51 +0100
X-Gm-Features: AQ5f1JrnWqaTGiu3U7FTh9LsfrjKTJW24XGJwpEE92tGL6toEdwgbBX4AyneZuc
Message-ID: <CANiq72kd2eTaPMcYSiQ61tZ2nX0jLM9SgsnbPEEbdNx+JQYFdg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 25, 2025 at 8:48=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> I think the one thing that's missing w.r.t. aliasing that Rust could
> maybe use is a kasan-style sanitizer, I think with treeborrows and "now
> we have an actual model for aliasing optimizations" it should be possible
> to write such a sanitizer. But the amount of code doing complicated
> enough stuff with unsafe should really be quite small, so - shouldn't be

Miri implements those models and can check code for conformance. It
can be used easily in the Rust playground (top-right corner -> Tools
-> Miri):

    https://play.rust-lang.org

However, it does not work when you involved C FFI, though, but you can
play there. For more advanced usage, e.g. testing a particular model
like Tree Borrows, I think you need to use it locally, since I am not
sure if flags can be passed yet.

I would like to get it, plus other tools, into Compiler Explorer, see
e.g. https://github.com/compiler-explorer/compiler-explorer/issues/2563.

Cheers,
Miguel

