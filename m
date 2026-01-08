Return-Path: <ksummit+bounces-2723-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F013D058BD
	for <lists@lfdr.de>; Thu, 08 Jan 2026 19:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EC8A307A6C3
	for <lists@lfdr.de>; Thu,  8 Jan 2026 18:27:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A389A313E15;
	Thu,  8 Jan 2026 18:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cHWoYOrJ"
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D3231353B
	for <ksummit@lists.linux.dev>; Thu,  8 Jan 2026 18:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896852; cv=none; b=EONLxOo+/oGpb8z8gerL73tbv5u4gxqh9nGyJ1XCN+NtJyqHCXfv83ism3x6l/bXETJ8tVTSlH93BOqM+Tawucq30iOP2pNdnPV4RGgHnpE7MnmqjTs+eHCvVo/TuvX+VPC/dyjrlEMiCxuG1LeU9q086251AzLVoIbMPhz9mNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896852; c=relaxed/simple;
	bh=ckK6U5mDM1K5qj55d8UFpzpuNIXJuUo2Lt2ZIMdlu5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzuXATKeOyFfULFiB3802GGUeoP2iLVEKQRJVw6mNmCSHi7FZKWGxnh+57LQgsR0XMzYdpCRSzr7Nnia7kNIz1fL4IRa0dqPG/aeLJrWRMQmB6jaoH1AR/RDg0tpDNSHR0DCbbVVSSUai2bI5nQ32IEnRC9fc0IgGf2N052uFmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cHWoYOrJ; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-122008e73c7so92244c88.2
        for <ksummit@lists.linux.dev>; Thu, 08 Jan 2026 10:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767896849; x=1768501649; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=denvpTaacLnNtz4te+wy3XScUNJz34hFVMFuAIppANs=;
        b=cHWoYOrJtcT2dY5V/yyC6uCo/VStxhfdgjY+iFec1cEXO6JpVT/mKAPKCKww/UTYIh
         o+4s23QDjGTYMmn1IlJNBn6Tnx6tXunuvpCkLklb5P4BYayNLMBjidd3N9+xwW8ocNLz
         g7fs9qfUStUNLbRBsg5Y8QP59qCsjR0Hc+YwlhKv+INvXYyIOD66HFF3pQhZJnNF91+E
         7+LxJka/xnRo87r7mipq+FzS4O8emYejzGF4Iynb9l+rW5nKQxJDmYpGlh6nkLqSEiTZ
         NOhb37BO2ZtqcrJBNYiTu/ldHWWQ32muB7gwXy68KVnjQw+xN+kbE6ii9U4tUU5hRGpI
         T+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767896849; x=1768501649;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=denvpTaacLnNtz4te+wy3XScUNJz34hFVMFuAIppANs=;
        b=S4MjdkIOcuVsMmNlOUzxIqFlV8+1SiOmnXvWULfZiiZtDE5xVYtBTZbl+JQeXkdfFF
         iMDjHzBucX9uuqOFhR8m+oYN9VU7oGGfzfSXXVeW1NRH97X5Tau9V2hEjEdkwnGom0QK
         +iyNbJvM+C7w/IGiTdsGvF84Ya3Wmy/IXTWZ7dwiQgAE+iabuvC10+P0CxKUOdvd4lrW
         JuXGUSAgeHvXthGOEBLtgsaBmOzhEXQ7ut1Pv3blP6nTEqwmxMJtjfAxCepzcrVAZwwH
         SdoXayY1CF07TTHxG8PifcRSo/oISBGoE1C3/R4mrqa/yf9zT0F3a0PJKlayz/yBsyC1
         s1EA==
X-Forwarded-Encrypted: i=1; AJvYcCVtWfHhRT1jHZcvpabUTs0xy/AzbPVBkz92qb464u9POOv2ocjYzFUg4gdb+B4GHs9PZx1OzK/o@lists.linux.dev
X-Gm-Message-State: AOJu0Yyzj6H34yGY7IrLmxnzikUrJfIras9WHG0SzxOrQQi4NcN4L8w4
	0ckpeW3JMYcSHrb1lATLnhzgZeoLUYjW3bS/MJ5Bp1P5ZwLI4nzhwHgI5/KKaH0D0I/9vO9kNB8
	WYcdDPUMqdWJH28Z6Pe/miVDbkbtJ0F0=
X-Gm-Gg: AY/fxX7XWIM4/nn733h+AOlB8NzxJ0M/cSEyC2kxQvhMkJetG3uUpENsDtVr2hQI/yR
	44Mtk6ywkWxvahHhl7CuEPrUdY/EPtoX/KxL6uAmVis5gOND8iU7DeCb9iFMKg5Gr3v5xUHHwmD
	oLw1C5jkgCExqXZJnVArzxgI3Vhdj0y81/cc0asHV/yTDo4O1/4PqcqKP5gsuJBvE+YVG5ulK1y
	Wlvu8KKDEcxxveQomcLZe2UmxHuyZgX/wOchQyy0fN9La3tU6JGbEYuICs71htfVuKBtUVNz7f7
	pjEgaYdWueXP2VHWjN60DByclkwTZyJOx051y6lYAifbJkKSdhDwj3F6MvGoiMF+LdSC+CMrdtO
	1jSzEr4GFxA==
X-Google-Smtp-Source: AGHT+IFoBjC4egDwXLOoj6ROkcmj08TNCPtcElGnZsp5q4/uA4anIrnFATecLsKaaDd4MJAoD0pG9LJKjUUjQDUZP70=
X-Received: by 2002:a05:7300:cc89:b0:2ae:5b31:5dc with SMTP id
 5a478bee46e88-2b17d336ad8mr2036772eec.7.1767896849443; Thu, 08 Jan 2026
 10:27:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local> <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local> <6c71554c-4fa1-4b99-9d46-2f1a2ecc1b7f@intel.com>
 <611c4a95-cbf2-492c-a991-e54042cf226a@lucifer.local> <aV_eiRqUsK2KWkww@laps>
In-Reply-To: <aV_eiRqUsK2KWkww@laps>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 19:27:17 +0100
X-Gm-Features: AQt7F2qDCAUIhdH7pbK8poUr7bJ5y5pAZxzFEZz5_jeiBnU1RGtwdzg2LKky2yI
Message-ID: <CANiq72mw1bis7aE9b=Htx9=Sd9jZH1rJmew1xqhPiCWu=EyzPw@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Sasha Levin <sashal@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Dave Hansen <dave.hansen@intel.com>, 
	Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	NeilBrown <neilb@ownmail.net>, "Theodore Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:42=E2=80=AFPM Sasha Levin <sashal@kernel.org> wrot=
e:
>
> We already have something like this in Documentation/process/howto.rst:
>
>    "Before making any actual modifications to the Linux kernel code, it i=
s
>     imperative to understand how the code in question works."

The patch already mentions something similar as well:

    Ensure that you understand your entire submission and are prepared
    to respond to review comments.

And then talks about the maintainers discretion and rejecting etc. at
the bullet list at the bottom, so it seems fairly clear to me, i.e.
that patches may get "rejected outright" if one cannot explain the
submitted series.

Cheers,
Miguel

