Return-Path: <ksummit+bounces-2573-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4409BE5D1E
	for <lists@lfdr.de>; Fri, 17 Oct 2025 01:53:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67A4F3ACF74
	for <lists@lfdr.de>; Thu, 16 Oct 2025 23:53:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A9B2E6CC6;
	Thu, 16 Oct 2025 23:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="VGVb9WQ8"
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A992E0917
	for <ksummit@lists.linux.dev>; Thu, 16 Oct 2025 23:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760658820; cv=none; b=i5X8PyhgqSqYR/Crr0qLjhJQCRDfLghyeAgpg3NsRbmB+CqspYxatKddU/XooyHa8TuxygpKMGt/YHTN9/Tgyk46he3oRCDDp/2/wKta2C5ID5eIxz1zfn16UxOrDgVGJHxzHrYAhc//gg5kS2JbdINg8R4GWho9Xyb68wOPzlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760658820; c=relaxed/simple;
	bh=i8nD3B28VzTRdWvto8Xasl6hZ9GbzNz9J8J19xtZJ10=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=swXg1YI38KZqB7KdehnGIKw1U4AmFoysw+OqPjIeiGYfAM2KVgfE8I7FWPgxdk1YgluTZuKfLOvNZCzfQlK+i6/99MWAEY79vR3fEu1IfSrKVEugZf7VBiX6ta13FxJGwkCtxAGv/nblePTE61f3QlvV6MwWCsfw5lQUm2Dhc20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=VGVb9WQ8; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Received: from ehlo.thunderbird.net ([192.55.60.44])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 59GNrSZI3320559
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 16 Oct 2025 16:53:29 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 59GNrSZI3320559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025092201; t=1760658809;
	bh=eMQ4hZLmaiwsvg1HFe26HnEeXCM3L0IzaxYpCg/9D60=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=VGVb9WQ8nbctTITDj4QxC7oWCv8JM/5vPf1OHNkK+UmYB3PfgCfvDQYsaNhv1mzrF
	 BhpGXt2Q+StYuhsywfAFjpsnAaB1m7CiKkE+PvfOwlrPJ2lMyWbtjld4MBGt/SdKOG
	 o4pZ9fQlrj/9nWk3a6LOyeyTX98n600JnSHGtgyDWJijqSrBEG/9YtbwJzSiILVvQB
	 0SI6Pb3AU7g9QRg+cpP8+EH6AVnWQfNHILkuw3DmIi1c0aNbCe/gkX1k/4ZjalZTqL
	 UmOR97voHFqlVMk59JYsXpwIrbAGPZENGnuQH9UUPHjNZyrYeK7HiIZ4ZjVvO/PelJ
	 Qg28aVoIoM1HA==
Date: Thu, 16 Oct 2025 16:53:19 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
        Rob Herring <robherring2@gmail.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Greg KH <gregkh@linuxfoundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        dan.j.williams@intel.com, Doug Anderson <dianders@chromium.org>,
        "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: Replacing Link trailers
User-Agent: K-9 Mail for Android
In-Reply-To: <a56020622eb8c4b34afd76a726f6d3ab54525ad3.camel@HansenPartnership.com>
References: <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch> <2025101448-overtake-mortality-99c8@gregkh> <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch> <20251015-versed-active-silkworm-bb87bd@lemur> <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com> <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com> <2025101631-foyer-wages-8458@gregkh> <892a58917795bf5d29394bb5123dae2a6615ca08.camel@HansenPartnership.com> <2025101639-thwarting-press-f0f7@gregkh> <ef52db7e1d08eb03376fd9343c965aab4dc71ce5.camel@HansenPartnership.com> <20251016-vehement-kittiwake-of-joy-d6db8e@lemur> <CAL_Jsq+VUh2Czq5KGPBoR056rMPxF_5W8ijuieZsU4RhPFwwpA@mail.gmail.com> <D8FFF43C-C8DC-4F7B-A56E-0C00328E0179@zytor.com> <a56020622eb8c4b34afd76a726f6d3ab54525ad3.camel@HansenPartnership.com>
Message-ID: <CE9DD2BC-BBE4-435E-A55E-B53AAEEF653D@zytor.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 16, 2025 12:32:48 PM PDT, James Bottomley <James=2EBottomley@Han=
senPartnership=2Ecom> wrote:
>On Thu, 2025-10-16 at 12:29 -0700, H=2E Peter Anvin wrote:
>[=2E=2E=2E]
>> The Message-ID is largely useless without a List-ID at least, and if
>> the maintainer picks it up directly then they will never see the
>> List-ID and would have to add it manually=2E=20
>
>Not really in the modern age=2E  Lore would always be my first choice
>because it doesn't need to know the list to resolve if it's archived
>the message, but even if that turns up nothing, a search engine should
>be able to index it (well, eventually, it seems to take them a few
>days)=2E
>
>Regards,
>
>James
>
>

But as Linus has pointed out: it shifts the workload to the user, where it=
 is less amenable to automation=2E

