Return-Path: <ksummit+bounces-2376-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C62B54CDE
	for <lists@lfdr.de>; Fri, 12 Sep 2025 14:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB4B04E2B32
	for <lists@lfdr.de>; Fri, 12 Sep 2025 12:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8303824A078;
	Fri, 12 Sep 2025 12:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZT3KPjcs"
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB5F3019CA
	for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 12:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757678871; cv=none; b=fj8DGeIsPdMu99hdf+scMNrOksx3B2/a0eU/oBLy3MdnfvuhRJnGN6pk2jUG6nkWPexw/C90duU33MMXHJDs0RvlZH9RGLuJYJmGQf2HytBHpHEJimyGPTgiPR1yabNx/YeHyffohHMqdpRGN8aawnAPH67SipdADAYyPi9z9Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757678871; c=relaxed/simple;
	bh=X6ZRNDaCuOivHijOYCFBVNSiy4/GhIk2pJhe7Q3P7xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCwn7lUHKr7pWJW+8Pi6RQI2uegZLs93wuE/p+DC9IIogI2Aeb2/W2pOe2Gt+hUKG4rNtPMrgM7pZyssktRraruWe0y6VGU/S+B/r9h8qDrxpQh3ikCNT/FT6T1bds9qyBFOmsdVwEZnxueEH4Fu3I8YOHmdP+gbzMrf/B0kKtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZT3KPjcs; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e9e137d69aaso1270680276.0
        for <ksummit@lists.linux.dev>; Fri, 12 Sep 2025 05:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757678869; x=1758283669; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41eguu5v2XlDnYkEFTiMmjx8hLfyx26Ce8ZNbdhYcMY=;
        b=ZT3KPjcswUP9uK697Ts5wHlE6+H4f5U2mvhN8l7okhN6icJg3Kc6Ssjb2FNjI7ie5A
         +12sag3hL2X4txUXL3xdr3DAu2uy8aD8LAoTrdIjKR6kF4ZfT/v99NcbX92kYpgRxo0E
         JVqXynjLcsZemQGfeV/NbZgGq5Xjx4wH0Dm39O3oro0vFMrrmkkhgQ6L4tI2OjmAyKGl
         wgoTDKuhzSjMWR0Q9WutHi75BIBdzwBmckuWAW6YZSVa1A5tgKhcgHsat/xjR4Dbk7zQ
         01oxBEZtVp+s0SDbp8JaQuQh0LoVCMTNpjzoutYDWWEuItJXNAGcYU7lE3N52ZIhc8Y2
         z9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757678869; x=1758283669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=41eguu5v2XlDnYkEFTiMmjx8hLfyx26Ce8ZNbdhYcMY=;
        b=Y/HOaWHtAM5Sjtz9RPYW2P9Y3ZY+5zZW8NfPxWQh2JsO6zRhjz7zrk8y72WfHuId5i
         dpxPfMb/CxVdEnWWPkoh12USphHZ1hlBxqvkA3bOO5kBxCY1sLzflRKR+tuPwKA9gVvt
         g8b0BwoetpcFbOYuDd5YxAOElhJQEaPuQpzmG82Hdd7jc8MY5MBsYLht/07RgfrZs/RY
         H/d2dWetHFJn11WJ4XGJoc+rflOZLOqKCEoU9Uby6JaF8M/Rr92RRD/+B08+r+43EVQl
         YHRJjp7vG3r+1+wsL3A8ElSbEEYLA/PRZUCgtdXNOi2FF0P84ieuiBeGNkalcUsyxrt8
         r9xw==
X-Forwarded-Encrypted: i=1; AJvYcCXeyUlMgpGqyYEZ6aVdHVNhzK5eCSEFP5gU9A1CyLKK/wxfzWam6O+p/CYNaLeWNMEErXcF3ICX@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd9vvbAswQFU4FmHvBcj3bJrwfEkkHVQzCvdIF8ykzSLA3xzBB
	M1lLadlCoD42ZhjnYJfNf4wN/C8G3F4kmAGW1QlO6RXDOwBODzGmQXT8FyDNoGK8HnrVdfaUbl8
	OMY26GX96kO1BCR17mw0q7nkswsGr4to=
X-Gm-Gg: ASbGncvVnTL62a5xGo4p1IZGDjyqGQW5ocIY6hdB1v+VJQNe1iXVDuxGfHX4ZTj/fGF
	rqmDkSgQgSygSnBwXRZGXBTa2FIAbv8DgegH07gTl6R4YOdbPxwhzsE5lvUClfOq4Sc46EgMf3Q
	mToBWVvyZcJSYNcL0EEmpBBy8sDT6qE+viO/ZtcJn6aXBDYo7tgXgpWn7DzuB4nLZ4h62DpUR6o
	nwZw4qh
X-Google-Smtp-Source: AGHT+IGMrv7yzxFFD+GGbV/xoOo0wN1bt9GQ2HpMgWaYbQ9p8xRzsTkvU6i+K1/SePmHlg4VgxO6o6DsT0HhhaBxfyo=
X-Received: by 2002:a05:690c:2606:b0:727:440:f34 with SMTP id
 00721157ae682-73064cfc0dbmr24106137b3.40.1757678868855; Fri, 12 Sep 2025
 05:07:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2025091207-blouse-scratch-dde3@gregkh> <0f876c7c-566b-476a-b590-d490d41d605c@intel.com>
In-Reply-To: <0f876c7c-566b-476a-b590-d490d41d605c@intel.com>
From: Konstantin Sinyuk <sinyuk@gmail.com>
Date: Fri, 12 Sep 2025 15:07:37 +0300
X-Gm-Features: Ac12FXzLxer-SHDMGppikjYxh4tD2XzOPgGSpYM0oIq_AdOu3eIMOJj6la8c7E8
Message-ID: <CAPpb9ymTGwMnJaALJOHx4TcMLxA22w_KcY8=Zxzy_Qy7Uk==9g@mail.gmail.com>
Subject: Re: [TECH TOPIC] UALink driver upstreaming
To: gregkh@linuxfoundation.org
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, ksummit@lists.linux.dev, 
	Konstantin Sinyuk <konstantin.sinyuk@intel.com>, Leon Romanovsky <leon@kernel.org>, ogabbay@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 09:22:29AM +0200, Linus Walleij wrote:
> On Thu, Sep 11, 2025 at 8:10=E2=80=AFPM Konstantin Sinyuk <sinyuk@gmail.c=
om> wrote:
>> On Thu, Sep 11, 2025 at 10:42:01AM +0200, Linus Walleij wrote:
>
>>> So this gives at hand that since this is no "ordinary" memory-mapped
>>> driver, it needs its own bus and therefore intuitively its own subsyste=
m?
>>>
>>> What about drivers/accel/ual where other accelerators live?
>>>
>>> Or if that is somehow inappropriate, just drivers/ual, don't be shy.
>>
>> Hi Linus,
>>
>> For the initial RFC, I thought to start under drivers/misc/ just as a
>> lightweight entry point to get early review. But I agree with you that
>> UALink fits more naturally as its own subsystem, similar to how CXL is
>> handled, rather than being grouped under accel. The long-term plan
>> should definitely be drivers/ual/.
>
> If you want to "ease in" drivers the appropriate place is drivers/staging=
.

Not really.  Staging is for "stuff that is not cleaned up yet and we
want to do that work in-tree".  It's best for existing code bases that
have been around for a while to get dropped in there and take advantage
of people wanting to do simple "first task" type of kernel patches
(coding style cleanups, shim layer removals, spelling fixes.)

It's almost never a good idea to use staging for a new subsystem as the
work it takes to get it merged out of staging is almost always more than
it would be to just do "all of the coding style cleanups first" out of
the tree and then merge it properly.

So I do not recommend staging for anything with an "active" developer
community, as it would just slow down the acceptance of the code to the
real part of the kernel.

> But if you have a focused team and you are going to start small
> and work on this then just use drivers/accel/ual from day 1.

Totally agreed.

---

Hi Greg, Linus,

Thanks for clarifying. I agree staging and misc are not good homes.

Strictly speaking, UALink is an interconnect fabric (rack=E2=80=91scale mem=
ory
semantic bus, closer to how CXL is structured) rather than an
accelerator device driver. The existing accel/ drivers (Gaudi, QAIC,
ivpu) are compute engines, while UAL should provide a cross=E2=80=91device =
bus
framework, so accel/ is not a perfect architectural fit.

That said, I understand the concern about creating a top=E2=80=91level
drivers/ual/ directory too early. Starting small under
drivers/accel/ual/ is clearly better than misc/, and I will coordinate
with Oded  to make sure it integrates cleanly there.

Longer term, as UAL adoption grows and multiple vendors hook into the
framework, the natural home would be a dedicated drivers/ual/, just as
CXL evolved into its own subsystem.

Best Regards,
 Konstantin

