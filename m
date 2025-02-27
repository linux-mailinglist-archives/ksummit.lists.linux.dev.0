Return-Path: <ksummit+bounces-2003-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E00A489DA
	for <lists@lfdr.de>; Thu, 27 Feb 2025 21:28:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9653D7A7A40
	for <lists@lfdr.de>; Thu, 27 Feb 2025 20:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A350222576;
	Thu, 27 Feb 2025 20:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="T3ZKr7KI"
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41E26A1A4
	for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 20:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740688114; cv=none; b=eGrWQzWy4TFHqS77h0ROQRgfLpHp/Ygchwn7IAINh7MKu1e+d+G9ThkUXpFYuGtuSCb8Wt8BbiDLYBqn1s3tmABh1QF6eCxYY7aFdEqhorfhUoBtk1VtcEP6BllVQI1aXZGKue1ZQRZb/M181SC8qWVuyWX7coILefiHw5GZzbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740688114; c=relaxed/simple;
	bh=H3HVkz+A6rXVuiDniuy3LDGPxjutY3NbEPqK++G8ir8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ASpjCA6lJKwwn3vAjKVcj8+gXVpGIrAZVfWOh3WR8fhyA/YEZXzGMuolzV7Oj0FGz1btuwtpIaboCj6jayxES2IectzNukVRgLQf9z5/FNCPw1snmE7Ky5d6bIMsdnQZT6SiM1uP1NqwDtvrZCMYNyrlPwHB9aPocqWStKMdnJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=T3ZKr7KI; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5ded69e6134so2262329a12.0
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 12:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1740688110; x=1741292910; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3iaC90NRH1e1Syvsd/il6x0lQMXHnv8BIHQEgKW5Yhc=;
        b=T3ZKr7KIa5Lwf7GQeed1HPlzHYkAUKCo8xdTKem2x6wZvIFBEpOrAdVyDu/eRavFOb
         Eti1a6AYk2rZmrJ75f10IH4wopVgn4mL/D6ZJ0nyv560qkQzGsNNY+BEpBLvMfdcxENC
         VjfGEQnKh///s6S36An5lpe5G5cDOlzZV6JJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740688110; x=1741292910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iaC90NRH1e1Syvsd/il6x0lQMXHnv8BIHQEgKW5Yhc=;
        b=w4qxLoaqBnlnFXjoDUsXzfrMeMLbPKanRVcukYbMSWpqVP4vS+v9YR5HUO73b2zG2E
         4HICkJO20/xAaTTmrQsRZNM1SOagaK1NJWKrm3QI+JFSpKDYCy/qn3AXLhZDxPLjNws3
         kK+OzWLJe9dQPhbFdYLNoDtGyCQ9h+8z+cqe0Q6zguxUIyrt9989dsEkvavg9JTzZcx9
         slDhl1UBzBOyuWV1H4+K0/M3jvFzQfl29r3RcLPAexF0m852nediwibgW+HflFH99r0k
         XPGBQ6HpyUD/HMkg9NxtGfnUXUGUVG8QqrxFYGmNxazF25oSf+MOtt8AZInj7hD8+Iz6
         /37w==
X-Forwarded-Encrypted: i=1; AJvYcCWhxjOOjL6a7okN5EKGkWcfx440Gj+kLp0GDzv4k80WX1y7gp+7js/0qOjZCXBFiy7OSDveM1uA@lists.linux.dev
X-Gm-Message-State: AOJu0YxfrwSiQa7CBPyF1b+0Z9XdbPVOrBpoUFnqqOb6KhsX7BVLnInK
	zCa7LGXGX4NhoGEHpjOp9+7l3RYP6tou0wpBaKidugE3v/LFLY+XCHVfdDNqncvkHnG4JKqka80
	FY5wg+Q==
X-Gm-Gg: ASbGncsinPjCQOW4c1PUVjSYRiyLaO1v2Iql8/J0dp4noyrAztMjjhJc59/oYSug1Bp
	k6pJRoQq9EC2ACShE1eWABum6dNseDhUwMD7m71wcfr3Wviq2X8tw6UCTYbPlptoZsJb/33Cr1h
	j2zxJ1FlPHZI4wHW9rtn1xWwsFkPtORFpXYCI4U+Rquk0D900lVHMxjR9pncQ7puLK/lqZG7kgu
	o+MJxUZa2vXjcZbfqGdN8dO5lTYmAKyWdII0PWHgWQBQZ/LiUuII+1FMGN2NdIdgVKzRjN094bq
	bT9Mm+lvwNn2uSCNsgISfC8KKwz96w6pEFMhKqytQw9jjRVuRHOe/na7dbhi6TZJVByTmxuGhZ1
	p
X-Google-Smtp-Source: AGHT+IFBOmu4bmBfHFfNQ0r6lNL5oM3aZLz4a7FovxyuOJKfARDzVGNWz/GtYAQVqouGksracz4bxA==
X-Received: by 2002:a17:907:7f86:b0:abe:e2ac:62db with SMTP id a640c23a62f3a-abf25d90142mr103750366b.7.1740688110100;
        Thu, 27 Feb 2025 12:28:30 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf0c7bc008sm172628966b.166.2025.02.27.12.28.29
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 12:28:29 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e0b70fb1daso2178232a12.1
        for <ksummit@lists.linux.dev>; Thu, 27 Feb 2025 12:28:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUS/AKVQXORO94zgwCJ6JDGDfFCYXjtaALwEN6n3Xj65tr27y9hcyvAKhUTV/bwlJ0q9TlqL52Q@lists.linux.dev
X-Received: by 2002:a17:907:c50a:b0:abe:ea93:2ca3 with SMTP id
 a640c23a62f3a-abf261d3cd5mr91983066b.29.1740688108692; Thu, 27 Feb 2025
 12:28:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAH5fLgh7Be0Eg=7UipL7PXqeV1Jq-1rpMJRa_sBkeiOgA7W9Cg@mail.gmail.com>
 <CAHk-=wgJQAPaYubnD3YNu8TYCLmmqs89ET4xE8LAe2AVFc_q9A@mail.gmail.com>
 <5d7363b0-785c-4101-8047-27cb7afb0364@ralfj.de> <CAHk-=wh=8sqvB-_TkwRnvL7jVA_xKbzsy9VH-GR93brSxTp60w@mail.gmail.com>
 <ed7ef66dbde453035117c3f2acb1daefa5bd19eb.camel@tugraz.at>
 <CAHk-=whLSWX=-5-z4Q8x1f_NLrHd0e3afbEwYPkkVSXj=xT-JQ@mail.gmail.com>
 <m4cbniqfsr5xpb2m7k53e7plc6he5ioyl2efiiftdmzod56usd@htwdppje6re5>
 <CAHk-=whEkEsGHWBMZ17v5=sq1uRe6g-BRHy5xNZK-2JBKRs=_A@mail.gmail.com>
 <0f3bc0e8-5111-4e2f-83b5-36b3aec0cbbd@ralfj.de> <CAHk-=wj37zT4Fy+mBFVRKPy=NMKcB6xBzqOuFrW0jOTv8LKozg@mail.gmail.com>
 <jei2vzllt5z6hufn3orqqupq3ufajcxv4zx3yfpkd2j54yr72e@vmhu4r3klvvh>
In-Reply-To: <jei2vzllt5z6hufn3orqqupq3ufajcxv4zx3yfpkd2j54yr72e@vmhu4r3klvvh>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 27 Feb 2025 12:28:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYCS6=TFfRHz_aG1HNFBDyLMnHgkvi_=B03-tX-OBtOg@mail.gmail.com>
X-Gm-Features: AQ5f1Jr2HELUmBJIPyKcHVA4YKc0nNSI_EcgaYvP2EtpcHUej5s4s67UyCptmgE
Message-ID: <CAHk-=wgYCS6=TFfRHz_aG1HNFBDyLMnHgkvi_=B03-tX-OBtOg@mail.gmail.com>
Subject: Re: C aggregate passing (Rust kernel policy)
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Ralf Jung <post@ralfj.de>, Martin Uecker <uecker@tugraz.at>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Ventura Jack <venturajack85@gmail.com>, Gary Guo <gary@garyguo.net>, airlied@gmail.com, 
	boqun.feng@gmail.com, david.laight.linux@gmail.com, ej@inai.de, 
	gregkh@linuxfoundation.org, hch@infradead.org, hpa@zytor.com, 
	ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	miguel.ojeda.sandonis@gmail.com, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Feb 2025 at 11:55, Kent Overstreet <kent.overstreet@linux.dev> wrote:
>
> It's more explicit, and that's probably not a bad thing - compare it to
> our smp_mb__after_atomic(), it's not uncommon to find code where the
> barriers are missing because the person who wrote the code was assuming
> x86.

Sadly, judging by the memory ordering discussions I saw, I will almost
guarantee you that the compiler support for memory ordering will be
buggy.

When we miss details in our wrappers or our users, we can fix them.

And when the compilers mess up, we'll use the wrappers anyway.

              Linus

