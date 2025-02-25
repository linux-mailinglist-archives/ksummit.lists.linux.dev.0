Return-Path: <ksummit+bounces-1891-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AE5A44847
	for <lists@lfdr.de>; Tue, 25 Feb 2025 18:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9723AF647
	for <lists@lfdr.de>; Tue, 25 Feb 2025 17:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FA98197A8E;
	Tue, 25 Feb 2025 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embecosm.com header.i=@embecosm.com header.b="gLSBxPwO"
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EEF18E75A
	for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 17:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740504269; cv=none; b=Up/qISfHaxXh5h2CUVU9OaG2tqZ6C7Vvsax1OddcVsol6C2GCAJbQxhX9uk7G5f24436o88N6nEMUbhTIa/dCLpUibWeDjBaDmpFlr5yJsmfaybRNwGx2zrWmfJ9PeHcBIHxZXSNyLx/ie8+f8OudDCCXaNse9pk+V2+KnxgupI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740504269; c=relaxed/simple;
	bh=95Dcrv2uDHGC0Dp8iVXfb4heiQgHSuPG8+H5erWocUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NCXGi0UZJxtox2erBFPxeezvG+hT5g9G7n/P+tIN4rLpZ0Ovm5P7LjdYbCmudHUwqbz+TsM0NIAwtgRlvM+SsKOUZgPIKNQ4DeDeSVrWgFNngD5FiGVUDpZIs38IUplgLAK2K/XTq21NjqL2M2kVGuc5iGydAIW5cAA4l4oIuY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embecosm.com; spf=pass smtp.mailfrom=embecosm.com; dkim=pass (2048-bit key) header.d=embecosm.com header.i=@embecosm.com header.b=gLSBxPwO; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embecosm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embecosm.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dec996069aso9517237a12.2
        for <ksummit@lists.linux.dev>; Tue, 25 Feb 2025 09:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embecosm.com; s=google; t=1740504264; x=1741109064; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y6zk364J/R5KD/YYx6jHat209JOl1kXKWaOdP8jqqrU=;
        b=gLSBxPwOk86sZbRPXLyW6TWA9NFvjL1ch+XTIcIqwD9QaDyTpqllAgbvEd75XdZgde
         Cph8AMdAs8dwUVNGryMF/5qv7h/xB8LQufcd2XGA9UiVEWkjF3BCA/pLf2AjFfL7vq92
         tvoMYMtqPxjnc5RKYY5Tt6tFF/Zzg0fR7axn3BsHmrqVeuAmDGtNXWTXOnSo3H/NDgsI
         qighIBYoXcLlZ3owDUKkjOTxdNz9tOIK35k6DMqoGrHjoXc2jjm5yXlEO+BmJuE7vxSt
         hIBYS7Qz/2kBOJIGuolO6lK0IY0hd/f0F+oKzIRWIjH6RoxMDOcebbe8DAmxUR4UAvNT
         KnxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740504264; x=1741109064;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y6zk364J/R5KD/YYx6jHat209JOl1kXKWaOdP8jqqrU=;
        b=lW7rU47TzSvIx/QX1PBfA5gimJ+bj/fvqIGQANXl0NnnrgcfVkGH2uzcDdFOOjtma9
         hARsvxrEcJ4+6y+Bmu+MjOy+0MLnp8qeatEchbOfT2ZLlxhEf5LQmmzI3JcZRHn2a0cm
         qZiA1xZrtIlyEcOSs7IK3SReFJLdjjRb2u/DSs5+GxiQDp84RB5ncv4rpN2HCPJ5jLQp
         R5usxpr3FoDeo/ps6ahC9pqMs16atsv+jPTP5Vtb2BkVZ/GcaUwEF9EHfFVCjp1rFGTm
         fIEuNAlLARZ1WeBtKjzVXaiRe8NkWO2xYApyLdellbXc3gkq2fp9K8R7JUwP5jNo5tTq
         +fAg==
X-Forwarded-Encrypted: i=1; AJvYcCW+gjpcFYNlXH7wNW3tJBcj/ib+IToaK7Mhk+CcT1bqlEnQGEhx3euxRRLbCdYf+wj+bmgN25QL@lists.linux.dev
X-Gm-Message-State: AOJu0Yxt/NAo8/6eg9+h2UlNUHApNBpWm/z+SasRucsxlIINjV9xd6c3
	xCle3qPaR+QQPoZGIDPPGgB56qg4jqGi4okvUNkSOuXbm8hIcAaZSA73tzV/Ug==
X-Gm-Gg: ASbGncs+5BSFCiw2ViyEbv+74di+1oFJzZLT4AyNw+STYNtGl6Q5Yiui6i2R2ubf/DB
	iH1/MglYhm+OR00NV0pPdn/5YijWY0eqCZEex5//3MubPOU6HNIhDJjt/GP7Q7vgVz/p/tz1ExM
	PRdu3vuEkOr1Xvah9Kzg9h8lqd7BhukQE1b7qHBItygzAg+LtM+zGgHoNZ+xeHRt4dnPd0l3jgi
	ClSK2Mq0BBCw6OyM7gumlJca9f150uZ7JB3P9zvgYd2VD8/XoED33zxkKL/RxVjk89yQRJ7x0U/
	6No3l/d4rcA5DMTXM2czGIWCtCyGC3T25H/fvNnjKwiBEQWKTqqn7xByVMIEUdJGB5EKM4pKbcs
	=
X-Google-Smtp-Source: AGHT+IFYgTuccyfOVhiD9IFpsBxuvShI076f0NTIveSZFdhJ2xPS/YHIZsCzb0q4s7AgcB0dNm1cxQ==
X-Received: by 2002:a05:6402:3493:b0:5d0:e563:4475 with SMTP id 4fb4d7f45d1cf-5e4a0e16844mr411687a12.29.1740504263983;
        Tue, 25 Feb 2025 09:24:23 -0800 (PST)
Received: from ?IPV6:2a04:cec2:9:b8f7:ed4c:446e:5532:d388? ([2a04:cec2:9:b8f7:ed4c:446e:5532:d388])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff866asm1483748a12.52.2025.02.25.09.24.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 09:24:23 -0800 (PST)
Message-ID: <4c9573ba-b939-4ac7-a163-9e8bd7052fe5@embecosm.com>
Date: Tue, 25 Feb 2025 18:30:01 +0100
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: C aggregate passing (Rust kernel policy)
To: Ventura Jack <venturajack85@gmail.com>,
 Philip Herron <herron.philip@googlemail.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Theodore Ts'o <tytso@mit.edu>, Linus Torvalds
 <torvalds@linux-foundation.org>, Kent Overstreet
 <kent.overstreet@linux.dev>, Gary Guo <gary@garyguo.net>, airlied@gmail.com,
 boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de,
 gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com,
 ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Ralf Jung <post@ralfj.de>,
 Antoni Boucher <bouanto@zoho.com>
References: <CAFJgqgRygssuSya_HCdswguuj3nDf_sP9y2zq4GGrN1-d7RMRw@mail.gmail.com>
 <20250222141521.1fe24871@eugeo>
 <CAFJgqgSG4iZE12Yg6deX3_VYSOLxkm5yr5yu25HxN+y4wPD5bg@mail.gmail.com>
 <6pwjvkejyw2wjxobu6ffeyolkk2fppuuvyrzqpigchqzhclnhm@v5zhfpmirk2c>
 <CAHk-=wgq1DvgNVoodk7JKc6BuU1m9UnoN+k=TLtxCAL7xTP=Dg@mail.gmail.com>
 <CAFJgqgSqMO724SQxinNqVGCGc7=ibUvVq-f7Qk1=S3A47Mr-ZQ@mail.gmail.com>
 <20250224125805.GA5729@mit.edu>
 <CANiq72k-K3-Cbnm=0556sXAWs0kXBCB4oR67M4UtD=fq=kyp7A@mail.gmail.com>
 <CANiq72mfQk_ViHJ9Y_rU0etS8XpORvZUNMc5m2iHL=pQDiVFSg@mail.gmail.com>
 <CAEvRbeo3QujuvRxjonhzqjQbO5e1_ut0LOSQsukH1T5vx=jzuw@mail.gmail.com>
 <CAFJgqgS8u=HZ4kps=9iEcw4ra2ocLU5YL+=YNB3Vo9E+1jNnXg@mail.gmail.com>
Content-Language: en-US
From: Arthur Cohen <arthur.cohen@embecosm.com>
In-Reply-To: <CAFJgqgS8u=HZ4kps=9iEcw4ra2ocLU5YL+=YNB3Vo9E+1jNnXg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi!

On 2/25/25 4:55 PM, Ventura Jack wrote:
> On Mon, Feb 24, 2025 at 9:42 AM Philip Herron
> <herron.philip@googlemail.com> wrote:
>> My 50 cents here is that gccrs is trying to follow rustc as a guide, and
>> there are a lot of assumptions in libcore about the compiler, such as lang
>> items, that we need to follow in order to compile Rust code. [Omitted]
>>
>> Thanks
>>
>> --Phil
> 
> Is this snippet from the Rust standard library an example of one
> of the assumptions about the compiler that the Rust standard library
> makes? The code explicitly assumes that LLVM is the backend of
> the compiler.
> 
> https://github.com/rust-lang/rust/blob/master/library/core/src/ffi/va_list.rs#L292-L301
> 
>          // FIXME: this should call `va_end`, but there's no clean way to
>          // guarantee that `drop` always gets inlined into its caller,
>          // so the `va_end` would get directly called from the same function as
>          // the corresponding `va_copy`. `man va_end` states that C
> requires this,
>          // and LLVM basically follows the C semantics, so we need to make sure
>          // that `va_end` is always called from the same function as `va_copy`.
>          // For more details, see https://github.com/rust-lang/rust/pull/59625
>          // and https://llvm.org/docs/LangRef.html#llvm-va-end-intrinsic.
>          //
>          // This works for now, since `va_end` is a no-op on all
> current LLVM targets.
> 
> How do you approach, or plan to approach, code like the above in gccrs?
> Maybe make a fork of the Rust standard library that only replaces the
> LLVM-dependent parts of the code? I do not know how widespread
> LLVM-dependent code is in the Rust standard library, nor how
> well-documented the dependence on LLVM typically is. In the above
> case, it is well-documented.
> 
> Best, VJ.

Things like that can be special-cased somewhat easily without 
necessarily forking the Rust standard library, which would make a lot of 
things a lot more difficult for us and would also not align with our 
objectives of not creating a rift in the Rust ecosystem.

The `VaListImpl` is a lang item in recent Rust versions as well as the 
one we currently target, which means it is a special type that the 
compiler has to know about, and that we can easily access its methods or 
trait implementation and add special consideration for instances of this 
type directly from the frontend. If we need to add a call to `va_end` 
anytime one of these is created, then we'll do so.

We will take special care to ensure that the code produced by gccrs 
matches the behavior of the code produced by rustc. To us, having the 
same behavior as rustc does not just mean behaving the same way when 
compiling code but also creating executables and libraries that behave 
the same way. We have already started multiple efforts towards comparing 
the behavior of rustc and gccrs and plan to continue working on this in 
the future to ensure maximum compatibility.

Kindly,

Arthur

