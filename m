Return-Path: <ksummit+bounces-2751-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A69D0B496
	for <lists@lfdr.de>; Fri, 09 Jan 2026 17:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5F16302D2EB
	for <lists@lfdr.de>; Fri,  9 Jan 2026 16:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A641364042;
	Fri,  9 Jan 2026 16:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0BaxQeH"
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7526D78F2B
	for <ksummit@lists.linux.dev>; Fri,  9 Jan 2026 16:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767976232; cv=none; b=TBibSOYMYE4TAXVb7AzPnqK3+H4lCAfeyDkVEpEQz8pql6azBiPq/qXRhVFuPmK8b6+anA7RtuVsrMbLyHQTH8IQR5XN+v0gjTzZvPLWqoh9XJrDNoDNAUJsvsF3zVCC3Mc0MTOHKAM0VGRur5p7FMaMtdwsvsg1pAmy8I2/MkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767976232; c=relaxed/simple;
	bh=tGnqbLmOhP9isHiPxWN/XPpA61Oj201z3O7nsWOI7Sc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5iTdX9XiSi44+iVEpHSD/l2M2e0PphIaC8J25vHjLH5b3SVr4W2LCMBzXnSJyf8oSOecLiPfrPQwyI9Nc5O5YRGC8/vHmuaq3R4/NWBDUC8XyqLuYFLEfJ61UpU9rNoHKqCkpTLShktbSbBgiu7Hj8SQD7tpvjM8Dzwn1/xLRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0BaxQeH; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b1161400afso190353eec.0
        for <ksummit@lists.linux.dev>; Fri, 09 Jan 2026 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767976230; x=1768581030; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KgVHrGpFOZu3o9W2smUjiAbx/IB6ia8N7DTDEB731Qg=;
        b=d0BaxQeHa0MkQunzil4QUIBR+mAQ+ref3Ny5+zKY/yoLEPkExxxCQUq6eJ7Dsw25ca
         FDuRDBaxLyft+GuMKInbG7Hro8ZVKy6radZkpPIKWHmKDwpFQ0zLNfsMvlVBEvzizfEp
         LyHXq0O4qep347jpluSEf432NXXP6eunD+8ZGvGLrAkbpNfb9MCS49T8sab1cbmvsn9l
         EEDiCOAmIfSb7UKTfNgQ/DpmA59BFxeHwTkTm9yktPJ3oxwpLAC/CFKteG8e4HAhwhxg
         7UnnstNqxfJ6Le2JRtXM4HDqZIntmRg9e5DPQg4mb3f7NZ86md5Fq+3IDjTiA+Jg4gIt
         VFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767976230; x=1768581030;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KgVHrGpFOZu3o9W2smUjiAbx/IB6ia8N7DTDEB731Qg=;
        b=RAn/zeA1M20s+BaiMzheE3heilHMjpfQOqLbF27TTfzvUyd/4teodcQ2rWuRjKGHA/
         2znu4DyV4OSmeBFxpk9QJu1LyigQutvsfYcpqTDseXxC3ZLNyJqzbcV5PU5cP/BBRNiQ
         Vwnvneq36oVCiQwJxubPGFhjcijrGDJIg4sg6NDW7M4ziZNqAy6kWl5UeSXgcnu6Vcq+
         gbFFaS6I2IEHGyn6kjvQPnMpwRZruFGB8NgPzFPV4ODY9x2GMwwchYW8NqSM9mx60bIx
         vkyX747S6gqFO5CBCv1Qsxz5A0Mh7hap70PHS/rpN6MMXmXIru2PSbCdBIiOEVwrNGoU
         3B5w==
X-Forwarded-Encrypted: i=1; AJvYcCWo38Bl33Kz9UDiDdgsjr/+HEmIXvOdOB8ZjTu+XL8qd6Czbt4zmVvVUNt1Dri1fLQZhFLRsV4C@lists.linux.dev
X-Gm-Message-State: AOJu0Yx40IalC/cRnD6obVVlprX9xBJurYp5dmK2UvGRKtThWFUDnY9N
	WHaqGt/qyhDJoZsbjFJ2Q28Fx25mjeB8ZUGoJ312E+PAilkFOqDKmDaVHL3tM3bWTCu6pSYAaeS
	aXT41Je1wR6xnEBcy7tYodUkThmJ3McU=
X-Gm-Gg: AY/fxX6sXHXNHwDVvupi5PHY071n+LLNPm5uz1A9O21zUqmiqopmjfd27wCKFPTFxkL
	kZiZExFffJXN/yraUHfr5BOqTbwI/GDtOsVto02a3xkJbrlP6bOQ2XOQVhD8hSiORnT1IWZog03
	xz6wOTn8p0egmfxxXYVGisAVDWaWwRixHnFvB3FY0Ud1sh7XRGfHd0NLGlmImqVThibPyiUyJE4
	iQbuPM6GpLgF4hMxSxvz23T5RS9F40cjUs8DyvZDb+hWKWGdy2veXpcWdGQ+1WF4lPSQGPTpQzd
	d1LXarrxrd3jpJRHsq/eKd0JqFj9tS4oZijypP/ot+cy2wsFJ7mThjNAZD9SofAzatc2naiodl9
	8ayvL8xVfwVEQ
X-Google-Smtp-Source: AGHT+IFPnMs8tYXrKC6QRTGlKt5c3UHbQ20I+iMpQeJtUFKAL06cbpiGchT05O1IclG935flftNB9uOe0tl1k8An8q0=
X-Received: by 2002:a05:693c:2a11:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b17d336c9amr3307855eec.6.1767976229504; Fri, 09 Jan 2026
 08:30:29 -0800 (PST)
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
 <CANiq72mw1bis7aE9b=Htx9=Sd9jZH1rJmew1xqhPiCWu=EyzPw@mail.gmail.com> <b7469e4e-d711-467f-839f-4a9688d25a23@lucifer.local>
In-Reply-To: <b7469e4e-d711-467f-839f-4a9688d25a23@lucifer.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 Jan 2026 17:30:17 +0100
X-Gm-Features: AZwV_Qi9VSP2AMrsmou5qnQmy5TBXFzhlEy2iJtX864Gee6M0-zqG561EpAZSLM
Message-ID: <CANiq72=yOkv_GK=V5k-WTYE-Fv++K+OtVUdrLQcH+75qRMN-Aw@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Sasha Levin <sashal@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	NeilBrown <neilb@ownmail.net>, "Theodore Ts'o" <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 8:28=E2=80=AFPM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> 'You _can_ be more transparent by adding information like this:...'

I am not a native speaker, but my reading of that "can" was that it is
suggesting ways to be more transparent that may or may not apply in
particular cases, but the requirement of being transparent was already
established by the previous sentence:

    Second, when making a contribution, be transparent about
    the origin of content in cover letters and changelogs.

Which is reinforced by another imperative in the bullet point about prompts=
:

    If code was largely generated from a single or short set of
    prompts, include those prompts.

Similarly, I read those other "might"s you quote like a set of things
that could happen or not (and is not exhaustive) in particular cases
and/or depending on the maintainer etc.

At least that is my reading, and as far as I understood the TAB
discussions, the goal of this patch was to document that non-trivial
tool usage needs to be disclosed, including LLM use, and to me the
patch already did that, but perhaps the wording can be more direct.

I hope that clarifies a bit...

Cheers,
Miguel

