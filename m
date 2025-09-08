Return-Path: <ksummit+bounces-2302-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EC3B4909F
	for <lists@lfdr.de>; Mon,  8 Sep 2025 16:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3465340C8C
	for <lists@lfdr.de>; Mon,  8 Sep 2025 14:01:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC40630C63F;
	Mon,  8 Sep 2025 14:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b="oFnoIEef"
Received: from lf-1-19.ptr.blmpb.com (lf-1-19.ptr.blmpb.com [103.149.242.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEB430C623
	for <ksummit@lists.linux.dev>; Mon,  8 Sep 2025 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.149.242.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757340065; cv=none; b=h6fQeSVaAc1NG+pfrt22qMc6Rz66eZi2gnm0Ep644X9zqISkvdafazE4dmX2X1Nn3tX+tSzhhxnOg0cx2tdgHeKv+RZpfMnSogkSWDlOleOA0wHnqazHqRuxujlQ5V2fotFGfkHJe6cc7UjBgSNjHjTzZXaqi3TH0lppSRSGCrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757340065; c=relaxed/simple;
	bh=aH5kDlwTu0MPR1S+wRyt8VxXKKfeGzxfaMuGJnTFVK0=;
	h=To:Mime-Version:Content-Type:Cc:Message-Id:From:Date:References:
	 Subject:In-Reply-To; b=JrMrUNP7w3cMjkZ2uEV6fSjPi9Sz40+gWFleR2Q5B29apu++edS3XLiBlu++cjY/OqGfc6mUANZnuTRZcsqFmfHwc6Iid3FpuH0OCqhsQC1KQY9nGswQ4oMmijNGUvHq+9ychD6wHbKiZYG6DxVSGloZaUqCvDGiuAS3xMoUNeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com; spf=fail smtp.mailfrom=fnnas.com; dkim=pass (2048-bit key) header.d=fnnas-com.20200927.dkim.feishu.cn header.i=@fnnas-com.20200927.dkim.feishu.cn header.b=oFnoIEef; arc=none smtp.client-ip=103.149.242.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fnnas.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fnnas.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1757339279;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=XfyYlnB6PXGPgmyybV4W+yTMAzDtCRH7recT8NdqS4U=;
 b=oFnoIEefS0joZnQQ7mD9C/3dKQsWJ2gPe+Yi9QFhHl0LYKN6IxblzkuTrWBaBi0+/Aym1p
 Ae/doJ2hFg0co6fzcIBvmovqxZMT1H0f8jH5ehhmbb4mSPNBNSfrLyrh5WAv1C4KkNp1iw
 JLYMooJNW+tu9OgcOS4UOik5gayTYhvxz/0OxnmTGC7kdeHrqRiyurDjTOj7LdCNtMkzAe
 3b9e1Fz+QLovNoK58zWqo0Hc5/R6eqcazcIoQveWOQeoZpR8hW/Q9/RYcsWiyJQN93BHU/
 WLDoawyq37zUTelnxVF2NiTFK8ng9x8TPk8+DCKROSCm+WGZl0n6Ziz5wQ9SqQ==
To: "Jan Kara" <jack@suse.cz>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Mailer: Apple Mail (2.3826.700.81)
Content-Transfer-Encoding: quoted-printable
Cc: <ksummit@lists.linux.dev>
Message-Id: <23E92A69-4C2F-40F4-9EC8-BE1F3EAAAA9F@fnnas.com>
From: "Coly Li" <colyli@fnnas.com>
Date: Mon, 8 Sep 2025 21:47:46 +0800
X-Lms-Return-Path: <lba+268bede8e+a53ce2+lists.linux.dev+colyli@fnnas.com>
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com> <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
X-Original-From: Coly Li <colyli@fnnas.com>
Received: from smtpclient.apple ([120.245.64.195]) by smtp.feishu.cn with ESMTPS; Mon, 08 Sep 2025 21:47:57 +0800
In-Reply-To: <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>

Hi Jan,

> 2025=E5=B9=B49=E6=9C=888=E6=97=A5 18:52=EF=BC=8CJan Kara <jack@suse.cz> =
=E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Coly!
>=20
> Maintainers summit is about process issues with the Linux kernel. Your
> proposal is for a technical discussion so it doesn't really fit there. Mo=
re
> fitting would be a Kernel summit track at LPC which is for technical

Copied. I will resend the proposal by kernel summit track format.

> topics. Given your topic is mostly a discussion on a relatively specializ=
ed
> filesystem topic, I think the best venue for this would be LSFMM summit
> next spring where you get the biggest concentration of people that have
> something to say to this topic. (OTOH it's going to be in Europe so I
> understand the location needn't be as convenient for you as LPC).
>=20

Yes this time it is better for both time and location.


> I'm not really on program committee for either a Maintainers summit or LP=
C
> so take this just as a friendly advice from a bystander :)
>=20

Thanks for your kind suggestion :-)

Coly Li


> Honza
>=20
> On Mon 08-09-25 16:33:54, Coly Li wrote:
>> This is Coly Li. I=E2=80=99ve been maintaining bcache for a while and ha=
ve met Linus,
>> Greg, Ted, and other maintainers in person at many conferences. Yes, I a=
m a
>> sustained and reliable kernel developer.
>>=20
>> Recently, I joined a startup (https://fnnas.com) that provides AI/LLM
>> capabilities for personal or micro-enterprise storage. We help users sha=
re and
>> communicate AI/LLM-processed information from their stored data more
>> conveniently.
>>=20
>> Our users can run highly compact LLMs on their own normal and inexpensiv=
e
>> hardware to process photos, videos, and documents using AI. Of course, i=
t=E2=80=99s slow
>> but that=E2=80=99s expected and acceptable. They can even come back to c=
heck the results
>> weeks later.
>>=20
>> In our use case, different people or roles store their personal and sens=
itive
>> data in the same storage pool, with different access controls granted to=
 AI/LLM
>> processing tasks. When they share specific information or data with othe=
rs
>> within the same machine or over the internet, the access control hierarc=
hy or
>> rules become highly complicated and impossible to handle with POSIX ACLs=
.
>>=20
>> We tried bypassing access control to user space, which worked well excep=
t for
>> scalability and performance:
>> - As the number and size of files increase, storing all access control r=
ules in
>>  user space memory doesn=E2=80=99t scale=E2=80=94especially on normal ma=
chines without huge
>>  memory resources.
>> - For some hot data sets (a group of files and directories), checking ac=
cess
>>  control rules in user space and hooking back to the kernel is highly
>>  inefficient.
>>=20
>> Therefore, the RichACL project comes back to mind. Of course, RichACL al=
one
>> isn=E2=80=99t enough. A high-level policy agent (in user space) is still=
 needed for
>> task/session-oriented access and sharing policy control, but RichACL can=
 help
>> implement file system-level access control. This would give us a context=
-aware
>> and highly efficient access control implementation.
>>=20
>> What I=E2=80=99d like to discuss is:
>> - After almost 10 years, should we reconsider RichACL in the AI/LLM era?
>> - What are the major barriers or remaining work needed to get RichACLs i=
nto
>>  upstream?
>>=20
>> Since our first public beta was released 13 months ago, we now have over=
 one-
>> million active installations running daily. This is a real workload for =
RichACL
>> and represents real feature demand from end users. If you=E2=80=99re int=
erested in this
>> topic, we=E2=80=99d be happy to provide more details about the access co=
ntrol
>> requirements in AI workloads and even show a live demo of the use case.
>>=20
>> Thanks in advance.
>>=20
>> Coly Li
>>=20
> --=20
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

