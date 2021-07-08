Return-Path: <ksummit+bounces-349-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 365133C16DD
	for <lists@lfdr.de>; Thu,  8 Jul 2021 18:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 12F891C0619
	for <lists@lfdr.de>; Thu,  8 Jul 2021 16:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDA2C2F80;
	Thu,  8 Jul 2021 16:07:46 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125F072
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 16:07:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9194C61925
	for <ksummit@lists.linux.dev>; Thu,  8 Jul 2021 16:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1625760465;
	bh=Or21o1TaX4BmvJ1dmrNfp/ngE6C1TNAlIObwu3iuXx8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=EOQW0twhLf9YYg9wEFpd6haafhIciNOAiZkqSDzsEQdXD2i4r8LbJv4ujgVJs2Neu
	 k7X56jo48z42o/La3kgD/ZrM4fKdpFCHUjc9AvvREnXZGYvhY4FuU/iu9nj37s+lLg
	 OdsbRhGMWMslBo9T8XXb/SW6VeF2gdDWTugzbFRMhkhksOsLbAeZNYwpyxmRsNSpd2
	 7S7fR2XkBeXes45+68dhsKcwSCdZYX3Neg8YkdYSpdFjSj/TcGHN9gFDU9TY853/T8
	 d1GSb/6Nv9Z2HcS0Bwnv1XaWO1D/apN3/xiK9sJYVL24yTJy2F4KPdo4qjNW6s02+S
	 dT9amJ0VMyrHg==
Received: by mail-ej1-f43.google.com with SMTP id gn32so10582911ejc.2
        for <ksummit@lists.linux.dev>; Thu, 08 Jul 2021 09:07:45 -0700 (PDT)
X-Gm-Message-State: AOAM530gjqn/r4wNjPNDzeZb0cqeqpR3QPK5Sg9JmrKqGmmNQ+c4c8Zn
	D9lii3nkGWok6zp+7iZx/oTCyMsfuGXjrbQZvPtWbA==
X-Google-Smtp-Source: ABdhPJyvpE0vFhfCM+Uto132Lkae0V4VYJHBzTsN14SRt5B2YcYAGud0g2TaeHTw8I9iFrISR87tF7gEQI6AWt6eZJw=
X-Received: by 2002:a17:907:1c98:: with SMTP id nb24mr32514568ejc.316.1625760464020;
 Thu, 08 Jul 2021 09:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72n=8Do_9suDeJdwoF_8ZR-uLEj2r9cRSB_k=yTk_q0FHw@mail.gmail.com>
 <1f2a62c19845e4602817c2130d47bbea02d04d1d.camel@HansenPartnership.com>
 <CANiq72=qa2jMUKyfPmH1q1jr8n_Tm7FMy0QyWRhhpinUrvMiNA@mail.gmail.com>
 <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com>
 <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com>
 <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com>
 <CAMuHMdWtRzoj9Evk2Eke08vjhySfYRXE1Uj7ZqXTZt-tuExXKQ@mail.gmail.com>
 <YOcApBj/puXe3Yig@google.com> <CAMuHMdW+zSO25vAriii0hAkvt_SkMhNxvundhAXsgFdmyZ-4oA@mail.gmail.com>
 <CANiq72mquf7oVc8hYntYvksuiLDwqUJKvtx7sri6XXgqAAVAsA@mail.gmail.com>
 <CAMuHMdXcL6iYzcL+W9NLkhk+bHXddHna6XYE_Wu6Wun9XKxm2A@mail.gmail.com>
 <CANiq72kGBz=ohqS_YbTGc_CuRGxd-xmim-RT=pHHjMzi=39gSw@mail.gmail.com> <CAMuHMdVeFtRp5tUbErqqyUXz2Mrz8kCc7XbYs4Y6vr8n50A_jA@mail.gmail.com>
In-Reply-To: <CAMuHMdVeFtRp5tUbErqqyUXz2Mrz8kCc7XbYs4Y6vr8n50A_jA@mail.gmail.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 8 Jul 2021 09:07:31 -0700
X-Gmail-Original-Message-ID: <CALCETrVGL6sPPoxPZmGy0xcfakL3XAF+KX27Ofid76__SxS4XA@mail.gmail.com>
Message-ID: <CALCETrVGL6sPPoxPZmGy0xcfakL3XAF+KX27Ofid76__SxS4XA@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@google.com>, Jan Kara <jack@suse.cz>, Greg KH <greg@kroah.com>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, 
	Julia Lawall <julia.lawall@inria.fr>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> On Jul 8, 2021, at 7:34 AM, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> =EF=BB=BFHi Miguel,
>
>> On Thu, Jul 8, 2021 at 4:28 PM Miguel Ojeda
>> <miguel.ojeda.sandonis@gmail.com> wrote:
>>> On Thu, Jul 8, 2021 at 4:18 PM Geert Uytterhoeven <geert@linux-m68k.org=
> wrote:
>>> Let's assume the caller access a member of the object regardless.
>>> What happens?
>>
>> That is the key: they cannot access it to begin with because the
>> returned `Option` is empty, so there is not even an object you can
>> "access", thus asking "what happens?" does not have a meaning.
>>
>> In code:
>>
>>    pub fn f(weak: Weak<i32>) {
>>        let strong =3D weak.upgrade();
>>
>>        if let Some(content) =3D strong {
>>            println!("{}", content);
>>        }
>>
>>        // There is no `content` here, so you cannot do anything with it
>
> What if I would ignore that? I.e.
>
>    let Some(content) =3D strong;
>    println!("{}", content);
>
> ?

That won=E2=80=99t compile. Pattern matching like this is fundamentally a
conditional operation. In Rust, or in pretty much any language with
proper =E2=80=9Csum types=E2=80=9D if you try to =E2=80=9Cdestructure=E2=80=
=9D something (the value
=E2=80=98strong=E2=80=99 here) and there=E2=80=99s a possibility that the p=
attern doesn=E2=80=99t
match, then the compiler will require that you have some sort of
appropriate condition.

Personally, for some types of programming, I find sum types by
themselves to be an even bigger win than Rust-style safety.  C has
unions, which are painful to use. Python has various hacks that are
unpleasant. C++ likes to pretend that std::variant is decent, but it=E2=80=
=99s
really quite moderate.  Rust, Haskell, etc all have very nice sum
types.

As the most basic example, C often uses a null pointer to mean
=E2=80=9Cnothing here=E2=80=9D, but you=E2=80=99re on your own to remember =
not to reference a
null pointer. In Rust a reference can=E2=80=99t be null, and Option can be
used to mean =E2=80=9Cmaybe something here, maybe not=E2=80=9D.  You can=E2=
=80=99t even
attempt to dereference the pointer without checking if it=E2=80=99s present=
.

For a more interesting example, a pointer to a page table entry could
be arranged to be a union of:

Empty: nothing there, but still has several bits of usable data
NextTable: a pointer to the next level of page tables
Page: a pointer to the physical address of the data along with access
rights and such

And one could manipulate page tables with no fear of forgetting about
the existence of huge pages =E2=80=94 if you try to write code that
misinterprets a huge page (Page) as a pointer to the next table down
(NextLevel), the language won=E2=80=99t let you.

