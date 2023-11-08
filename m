Return-Path: <ksummit+bounces-1199-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CA27E5FFC
	for <lists@lfdr.de>; Wed,  8 Nov 2023 22:30:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 737111C208B0
	for <lists@lfdr.de>; Wed,  8 Nov 2023 21:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58651374F5;
	Wed,  8 Nov 2023 21:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZnM2/aw"
X-Original-To: ksummit@lists.linux.dev
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4018374D5
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F56AC433C7
	for <ksummit@lists.linux.dev>; Wed,  8 Nov 2023 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699479033;
	bh=/l4Pzhzkz7+9zJfP6zom5tvKVSStrcbreY3FhpQM7ns=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QZnM2/awJLa/ng9fk/l5V1yYdjLu9T5t5pMdF3783azdk1sBLI3KO7Uj7YX8EpZ9m
	 p0A38TUU+j1QChoDSMwVVodNtaDPCnvzMvYQIKT8SYJrpMeZe5neSV5MABQhRB+ARs
	 aQMAhcktl/Uvy7kwVzl5MgJO6imxmzl8MDKB2AyXSXakTgdAcIzl3B1nAZsqGHI9J+
	 R+52tGvtDgFGZsxv6zVl0kp7TYMCPFrfGeTJ2JLtxTFCxvjR948uLERBS+6NsZZBqB
	 NktAEtO9iJfFsJ5MKkexkMx18yzi4UN4aYcJaR8Mjikr211ievqXTbchfjNDsxa0Mb
	 665bCu8SL92dg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-507be298d2aso177762e87.1
        for <ksummit@lists.linux.dev>; Wed, 08 Nov 2023 13:30:33 -0800 (PST)
X-Gm-Message-State: AOJu0YyLbXgLzyeW2NRCC12cyhw2j288xlzf97LDf33+VxTUC+C5sOJI
	RNH0wA1lrfjRKeYiPGEIYEXQbmu08fTsVD6c/g==
X-Google-Smtp-Source: AGHT+IGG1w1QtzzA7V9fmYJ1BTgvaq0uiAgaoUdKQxPnC8FZ/9HM1XePalJ5gl0IMPlY1QVhZvLpcjovichb7aZCleg=
X-Received: by 2002:a05:6512:230c:b0:507:aaab:528c with SMTP id
 o12-20020a056512230c00b00507aaab528cmr2651294lfu.69.1699479031523; Wed, 08
 Nov 2023 13:30:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <BN8PR13MB27385D63AA7DAF65B6CAAA34FDA8A@BN8PR13MB2738.namprd13.prod.outlook.com>
 <d9309638d8f6037e661c3450ef3342dd915d66eb.camel@HansenPartnership.com>
In-Reply-To: <d9309638d8f6037e661c3450ef3342dd915d66eb.camel@HansenPartnership.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Nov 2023 15:30:18 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+j1f_MkLaA3WBG-u1oA5gQra4PyoHmpta=gxB94Q1XrQ@mail.gmail.com>
Message-ID: <CAL_Jsq+j1f_MkLaA3WBG-u1oA5gQra4PyoHmpta=gxB94Q1XrQ@mail.gmail.com>
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from linux-kernel@vger.kernel.org
To: James Bottomley <James.Bottomley@hansenpartnership.com>, "Bird, Tim" <tim.bird@sony.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"users@linux.kernel.org" <users@linux.kernel.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 8, 2023 at 3:04=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
>
> On Wed, 2023-11-08 at 20:04 +0000, Bird, Tim wrote:
> > Is there a way to use b4, lei, lore, etc. for responding to mail on a
> > list one is not subscribed to?
>
> lore has a "reply" link which formats a reply correctly to be in-reply-
> to the email (provided your local mail client supports this).

That just lists 3 options for replying. The first is the manual way to
do what Tony said with b4. The other 2 are use git-send-email or a
mailto: link, both which leave quoting up to the user.

b4 works great if you have the message-id already. Use lei if you want
a mbox of search results.

Rob

