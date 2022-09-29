Return-Path: <ksummit+bounces-797-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BA85EF9B9
	for <lists@lfdr.de>; Thu, 29 Sep 2022 18:07:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C6111C20A10
	for <lists@lfdr.de>; Thu, 29 Sep 2022 16:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2FB253A1;
	Thu, 29 Sep 2022 16:07:00 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mout-xforward.gmx.net (mout-xforward.gmx.net [82.165.159.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5878E5395;
	Thu, 29 Sep 2022 16:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664467612;
	bh=YnWkIqWh+3LQ4hERC7FwXLMumQkE9n7lG9QWXcIze4o=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LCBMX2RyOKSE7T7FjqAMVC7nKd1ij/s2ZnY4cdxSUg7kLUITMfqVvbwcG6vaoQShW
	 F5G+czRUVLeNc6TRp9ujogp1iefhoxxJl1iuYwaAYDWR8bmRC7cxrGd7YuEefBWD36
	 nJ9DNPKZZySLTYfZbysCLMT6VFnsPjoKJ/kE2Xpo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.7.110.20] ([143.244.37.136]) by mail.gmx.net (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MVvLB-1olKbh1oJB-00RsAX; Thu, 29
 Sep 2022 18:06:52 +0200
Message-ID: <591ab7d4-b283-32bf-13d8-419a5b91c365@gmx.com>
Date: Thu, 29 Sep 2022 16:06:50 +0000
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 ksummit@lists.linux.dev
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <05d149a0-e3de-8b09-ecc0-3ea73e080be3@leemhuis.info>
 <93a37d72-9a88-2eec-5125-9db3d67f5b65@gmx.com>
 <20220929130410.hxtmwmoogzkwcey7@meerkat.local>
 <7b427b41-9446-063d-3161-e43eb2e353f9@gmx.com>
 <20220929135325.4riz4ijva2vc7q5p@meerkat.local>
 <95c3384b-53d0-fd6c-6ec5-a7e03fdeddfc@gmx.com>
 <20220929153135.vu43n5kgdj4a3at6@meerkat.local>
From: "Artem S. Tashkinov" <aros@gmx.com>
In-Reply-To: <20220929153135.vu43n5kgdj4a3at6@meerkat.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:saJyJPn8PqIzQByG/rKBe2b89u6WU6DGo6IScjmTRLVj6tnx0bd
 GxRsCY5GX6dc8ps/wXXoa2mwbBvU3tu5dRy86hvZQi9Zd1yXZzPYbiTsDvZMxl57N8QpbC+
 S4J/3ielwbWQ7JAuR6R6HStpL1QXVbSExw46ME05Zaig3lrVnHB58VtfzJ/u+Eqbxjrtyf9
 EzITY7noJggmujpUfdiaA==
X-Spam-Flag: YES
X-UI-Out-Filterresults: junk:10;V03:K0:8TYXXS9cfNw=:954dzzyDfQB2Nl7wkjBn1iiU
 EI3zMysz4AZUdaZrMtpfOPIkrVPD/IIshSLRU+9SpC4TzOazAZvyDznNfQQ1D/LSmsgOdgX+E
 JUm4S6ofcJ1cUt+g8RIILyq6v/yNRSzCO4zhFBEUp/hm0xHTPdY61bzEnDwlpSdtqP2DFvvcf
 IK/kSuphb+d93izlZ+5Vk1wLMGqtmuyr3YZysjq0qYzjKYONRsyOur6m5IJ0b0E1Htk8KtzsP
 I+DdJarXHxQAKPfcfgqAD+bZwYVBwz2YISXTpcvBlojgf0m8LcNPnzPnjajnI/MGKNyMYuPdV
 +xnHRy42BB1tg1WUlU8edIuubDojtOUosMPworheBsOwmbg4qbxo/WYnuk6mQFllhj/G1zOXD
 S6e3XW4SlcbTouJUjt0n/IUw++073zQwPVxNoEEXHC7vPceqceAxfVMVQR4dC2sVBR7z3qbDY
 geBsDzTJ3nXO6pRdAH37rOt3hMwNrKTCCI5NlQ4E5o68bED4s4fxwsITfp/hB8e4V9lKurfxI
 JIqnRW7dFWMZSg0pXn8/HbTT0/R5NVX7gL+q+45CVXMc/HxBQ5JEILzmwfBMVZxJ4OExw1A27
 kIAIt7WhaGHCfSVINppWCq/WWzbVJGn8/iPl9JXFCWTQyjJWAxIYQDn1Vowiizmi5PUxoT8Mi
 M5K5T5OTRZJAAd0HONNQm6RkQ/FhGNXgepzg7LC6sLVXcRNZGle0VaUwHencyoVPS/ZEOCmk1
 EfqHnku0idIk1goIrcrAoOz2p/VseGYIPk3hoyEzTJS9/mZEm7zGqyEfb2akcPaK+HXoHzvPF
 7zrxbKHtJEBfD1Fwk3HkpcPijohefLscHMiYkQrEtaSrJM1sLWNK7bKBCNOqJbVAljD/ONayG
 kp0F5lhVwxFr6TSG7rozdEvc3wZKwfO8toM8CAp9QpXKtl3NNFzSpU1TWrXMqylsF0YwuKNlu
 mapYTbBFtgWAnqmhZFl0mJ8F4O99de3VifO5oT4uYmVOnYREpR0CefNAK5qExd34sS4ZmPQwe
 KrQp0guCbuJvnMxxfEPWb/glTj6uBtX9J5BPudElgTNS6sTLtwRLRk+pERVfxsHgZWO+YfUpN
 a/tWxbQdRRwGA3dUl7OV2LU4fy9DNKe/C6Zu1gJ6u8XWto9CdeSngDzZLN7kd9DPX0xo7t8iV
 U2W0Fm1cJDpcQVX6IMO5g9h9pVleFP8FD32Zzihimqu25w==



On 9/29/22 15:31, Konstantin Ryabitsev wrote:
> On Thu, Sep 29, 2022 at 02:22:10PM +0000, Artem S. Tashkinov wrote:
>> * Delete all the components.
>> * Leave a catch-all one.
>> * Let bug reports rot because no one will ever see them. Almost just
>> like now. Don't remind me of mailing lists.
>
> This is my proposal, except also:
>
> 1. post all new bugs and comments to a public-inbox feed that people can=
 query
>     via lore.kernel.org and tooling like lei.
>
>> Sarcasm and pain aside, Linus Torvalds himself _via Bugzilla_ has helpe=
d
>> me resolve critical issues on several occasions while my messages to
>> LKML were simply _ignored_. Think about that.
>
> In fact, he probably did this by replying to emails, not via the web
> interface.

Nope, I CC'ed him.

>
>> Mailing lists will not work for such a huge project. Period. In the
>> early 90s they worked, but we are 25 years later with millions more
>> users. With a ton more of a ton more complicated hardware.
>
> We've recognized this a while ago, which is why our efforts have been ta=
rgeted
> at query-based message feeds. Hence, tools like lore.kernel.org and lei.=
 It's
> a work in progress, for sure, but it doesn't require any "everyone must =
switch
> workflows today" kind of coordination, and avoids introducing single poi=
nts of
> failure by making it easy to replicate everything to mirrored systems.
>
> -K

