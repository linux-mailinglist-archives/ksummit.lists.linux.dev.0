Return-Path: <ksummit+bounces-376-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id E56A83C3409
	for <lists@lfdr.de>; Sat, 10 Jul 2021 12:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id EFAE01C0EF1
	for <lists@lfdr.de>; Sat, 10 Jul 2021 10:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2931E2F80;
	Sat, 10 Jul 2021 10:01:39 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from haggis.mythic-beasts.com (haggis.mythic-beasts.com [46.235.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B412168
	for <ksummit@lists.linux.dev>; Sat, 10 Jul 2021 10:01:37 +0000 (UTC)
Received: from [81.101.6.87] (port=55660 helo=[192.168.0.8])
	by haggis.mythic-beasts.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92.3)
	(envelope-from <jic23@jic23.retrosnub.co.uk>)
	id 1m29fh-0007AB-4X; Sat, 10 Jul 2021 10:53:17 +0100
Date: Sat, 10 Jul 2021 10:53:07 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <CANiq72=gjOZsy8NMw-tUSjhfeAnBTot59d0NoCO7sY3h=YTRrQ@mail.gmail.com>
References: <YOXL6Th+pot9+Fp3@kroah.com> <YOXd9WoafgBr1Nkv@google.com> <YOXibDV8mHT1e6ec@kroah.com> <YOX+N1D7AqmrY+Oa@google.com> <20210707203827.GI18396@quack2.suse.cz> <YOY0HLj5ld6zHJHU@google.com> <YOaW/pR0na5N9GiT@kroah.com> <YOb/aJC2VuOcz3YY@google.com> <YOdJLYmUkoMyszO7@kroah.com> <CACRpkdaMZQSQQu_w76S6DBhQ2_ah4Lfz==NdNDBMsSXuW8m-rw@mail.gmail.com> <20210709170649.GD4112@sirena.org.uk> <CANiq72=gjOZsy8NMw-tUSjhfeAnBTot59d0NoCO7sY3h=YTRrQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [TECH TOPIC] Rust for Linux
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,Mark Brown <broonie@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>,Greg KH <greg@kroah.com>,Bartosz Golaszewski <bgolaszewski@baylibre.com>,Kees Cook <keescook@chromium.org>,Wedson Almeida Filho <wedsonaf@google.com>,Jan Kara <jack@suse.cz>,James Bottomley <James.Bottomley@hansenpartnership.com>,Julia Lawall <julia.lawall@inria.fr>,Laurent Pinchart <laurent.pinchart@ideasonboard.com>,Roland Dreier <roland@kernel.org>,ksummit@lists.linux.dev,Viresh Kumar <viresh.kumar@linaro.org>,esteban.blanc@epita.fr,martin.schmidt@epita.fr,"cohenarthur.dev" <cohenarthur.dev@gmail.com>
From: Jonathan Cameron <jic23@jic23.retrosnub.co.uk>
Message-ID: <102752B7-A1A2-4036-84DC-5C4E1052FDB9@jic23.retrosnub.co.uk>
X-BlackCat-Spam-Score: 0
X-Spam-Status: No, score=-0.1



On 9 July 2021 18:43:09 BST, Miguel Ojeda <miguel=2Eojeda=2Esandonis@gmail=
=2Ecom> wrote:
>On Fri, Jul 9, 2021 at 7:07 PM Mark Brown <broonie@kernel=2Eorg> wrote:
>>
>> SPI might also be interesting here and I think there's some SPI
>> controllers emulated in qemu, though no idea how well or specific
>> instructions for any boards=2E  There's a bit more concurrency and so
>on
>> stuff going on in the framework=2E
>
>[Cc'ing Arthur, Esteban and Martin since they have been working on SPI]

I use qemu with both spi and gpio for testing IIO drivers=2E=2E  Not bothe=
red upstreaming
the IIO device emulation as generally throw away quality code to ensure I =
don't
break things when doing nasty driver reactors=2E  I have a request that I =
need to
respond to though to share one particular setup used for the ad7280a=2E  S=
hould get
 to that this weekend=2E=20

https://lore=2Ekernel=2Eorg/linux-iio/YNIfkaRZtWIXPbAj@marsc=2E168=2E1=2E7=
/

Some devices are too much a pain to deal with in real hardware and the qem=
u route
gives very fast development cycles even if you plan to do final tests on r=
eal devices=2E=20

Jonathan

>
>Cheers,
>Miguel

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

