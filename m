Return-Path: <ksummit+bounces-2705-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B786D03608
	for <lists@lfdr.de>; Thu, 08 Jan 2026 15:35:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8EF96310DF55
	for <lists@lfdr.de>; Thu,  8 Jan 2026 14:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FC241B362;
	Thu,  8 Jan 2026 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z2+eVO/T"
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F6C19D074
	for <ksummit@lists.linux.dev>; Thu,  8 Jan 2026 11:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767872649; cv=none; b=n1CITtNNmAyfJhcJ7VK8s8/OsWZYO7QyoVUSB/MNqGNXqD7lWUYCtrtFxlW2Q6Bo1HIArPHjIY/a43lfYKVSdwN58bN0m4/L1NAISZkpfY9m91W7+mKk0fX8MU6CcjdkyWoC6TqCVTs7OzyLwOt9x6idvnxtJ+jfbqxO3bk3dQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767872649; c=relaxed/simple;
	bh=xrGR+hVbQqlFVi+oVhz/8flmRpK+x6YDEgVW+X8KGBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SkJC9LB0NvenfSH6TdmWIFqacSVEReDApFAJXpH2nSkH1fiVDr8zz/hfb9ibz9kBDitTcYSZDuN4i3XRhce+hMQbAsU7kw0nz+A+BQBt5mq+iRVg1kqxvTDWBbgxugAV16GCNF4wwf2wIW6IdCiPyZSTWeRHFnoKp+E3iBs/Itw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z2+eVO/T; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12055b489e0so239191c88.3
        for <ksummit@lists.linux.dev>; Thu, 08 Jan 2026 03:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767872643; x=1768477443; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xrGR+hVbQqlFVi+oVhz/8flmRpK+x6YDEgVW+X8KGBA=;
        b=Z2+eVO/TISzwftZ+Qi5GIFeR2XOkkgjoXK1o5gARcjnfgZif/lSAFFNdeKojAIODAP
         +kjqkciecCwYHf7tBX45AFBBIknsbplrUr1f+/WUKKWZrwVU05PPefY/vV0j4Jx/+Z31
         iQWke1VGatSIO3u3ZQyfysMa1rhfUaWv5w6JZW7IEdmClbO3RZUZjNKKXhqAQXcQrkgT
         blwOBpukJRPBeDoKF407htlIF2FUXvhimfYU4zqS0nmtAfnn+2fiNYWAGE7SkI6C6JJI
         ryzVUMKxBy0NdfAMERZDAgekdVyrwvfU69cbvaYqQpgsxfDGil5WWddkfPKl9jac5/LY
         ocxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767872643; x=1768477443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xrGR+hVbQqlFVi+oVhz/8flmRpK+x6YDEgVW+X8KGBA=;
        b=bt65cMS5WLvdQ8y1p4Ws8Bf7Jf1KiBc4OmDw6LOSl6qLnsWdxxmpNJyw15uC0g3ssV
         peFY6y8nQ6Rx17LQE3n5K1XRsMK5EtlSE93s3UA7R+vvRBaA2Cs6w/q3F3hPao9fUO8M
         CA3wgduiJ2Cc7UvL4+KDsy6aND52nBSNB5Nsdy8xzARyfeOlXVtOsmHKQmpCtmfHv0H0
         BufTuqoVcsq2DdKxLnqum8gsKwFgzHdrKl/Mf0hGOkN81UC8d8E7uwz8iHmO/OwkmZYv
         oNl8qvFf70s7DjuTVoXKhRoVxI1YthfnSliyLhn4BvZ7RSLvEhOXoTUPOEk7TGPc3DkU
         VH+g==
X-Forwarded-Encrypted: i=1; AJvYcCURlNK2AhzzPVjAyghua1vt69ydCKd0EGEVr/AN3NTHFa4bE2KLZIoGSqGcD0W1FqGznVTOVH8J@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/29vqpgrIuo8jwwloa6a3j1iPsYqGj4ayQBIkA1rWjQtQGb8l
	4d91EhyjQaPGmNkEwi4NfQxlhiYPLk1OcggR7pn3O56EE7YlcyVxxBicuSEmIiKoV/t/io/B3pG
	kCebPUVQCNCTs089f9uuvy5fSVE6XUaw=
X-Gm-Gg: AY/fxX6rfeJpUpRH4BI6p4uF0OJXY8KAGKuMsSklah6qsb0D1fO0TFI8Fz7C1Q8Hq7U
	yn6acJdekG8nHYthsUphSyiEPWvQ4uyKRAJTugPfZfJT4LwHe8DXSypoIQpPncxvOTxiA8W69t4
	eP9XhuRfBPua7Eh5ZAW8oRG1W4S+DTNbVfC2AQvq2o9g9HfQYN3tbt71b1RgBBQULlQT1WXmHQB
	7Yvr5Jic+GZ8EYfu8L4X7g+Xfc9KUViemnxTfGeou72T9YoELUbGQQ4MnCRXTgW8ssc/GCTSnON
	2e1pmnVZoQmQwQUITozi+FeTBxltRzzHAdIrt2+dxRvvoZ6DQzf4+WhBpnCBkFo+Lc0PjHsc7V7
	qn9ClZBDNU1On
X-Google-Smtp-Source: AGHT+IGcKac8pMZKDwsN7xuSxYAyxgcvhsM6SPIjYlDaOewWATgxRpDucjk7Ps207GV5/FmCzkkyu0SHsvtEnJDfQrI=
X-Received: by 2002:a05:7300:2154:b0:2b1:79b7:5850 with SMTP id
 5a478bee46e88-2b17d34ee36mr2839354eec.8.1767872643019; Thu, 08 Jan 2026
 03:44:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local> <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local> <695ef146d651b_4b7a1002a@dwillia2-mobl4.notmuch>
 <12d910d5-0937-4aba-976c-9872289d21a4@lucifer.local>
In-Reply-To: <12d910d5-0937-4aba-976c-9872289d21a4@lucifer.local>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 12:43:50 +0100
X-Gm-Features: AQt7F2rvxjAETKAD5srp3jzV_wjMxBVwOH5dnDfOEbg3clqbr6a0nzFAf6Kezqs
Message-ID: <CANiq72nmAw0sZZHJfSoHOZ5rXgoi7O4kETASp2F62XyALqZ8gA@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: dan.j.williams@intel.com, Dave Hansen <dave@sr71.net>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	NeilBrown <neilb@ownmail.net>, "Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 11:29=E2=80=AFAM Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> I really don't think it is the case that maintainers can simplly dismiss =
an
> entire series like that.

I think Dan was referring to all kinds of series, i.e. maintainers
have leeway to reject proposals, whether they are big or small and
whether they are new features or cleanups.

After all, the project works by trusting maintainers to do the right
thing (i.e. the best they can with the information and time at their
disposal), but sometimes there may not be concrete technical reasons.

For instance, sometimes it is just a matter of bandwidth -- if
maintainers cannot maintain the code, and no one (that is trusted to
some degree) is willing to do so, then it would be a bad idea to take
the code anyway, even if the feature is great, whether LLM-generated
or not.

That is also why it is often said that it is a good idea to contact
maintainers/community before developing completely a new feature etc.
etc.

So if a subsystem suddenly starts to get an onslaught of series like
you warn about, then they cannot be expected to review and give
technical feedback to everything, and they will need to prioritize
somehow (e.g. fixes), or try to get more maintainers, or raise the
issue in ksummit, etc.

At least, that is my take, i.e. we need to allow maintainers to adjust
as things come. And, of course, as a community, we can always reassess
as conditions change.

Cheers,
Miguel

