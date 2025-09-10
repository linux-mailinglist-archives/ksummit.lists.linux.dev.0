Return-Path: <ksummit+bounces-2323-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF425B520B2
	for <lists@lfdr.de>; Wed, 10 Sep 2025 21:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7635A5E3EF1
	for <lists@lfdr.de>; Wed, 10 Sep 2025 19:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29E792D46AB;
	Wed, 10 Sep 2025 19:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="I91Dtyrt"
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B5F2D3EE1
	for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 19:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757531529; cv=none; b=N7ghQBFLekBkiD6FkUZeJbr8aSyU2Qev/OtUo/K+r+PDZnC42O4PDKyEHZFp6pfu1SbAWSG7tsGa1lTOP8GHzWtaRC77ERcOs3W422jS7glghfFI5HEWOR+Lf53fIGj1KUWH70+upeP98Y8X8gCWMc4Zs7xshGI5l/wTpNSWBkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757531529; c=relaxed/simple;
	bh=T4GEY6Gg82cZ0dfnu/7lVVZerK/EfYF5/GFhaY2+MWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TcNpWl9xr+mDsXt47Ii1/OEYaKTPDf8tcS7jI7XELmNQrQHARjMNfgoExgeq2gRJRShXHqs8Nu7y8R83PJXboBWjnALsbJ0uPsmQiC1v8lNrmysnB/WIBkfa/M/Ufn8XxMlkW+BwMDSkZQlGzJAn1odIVSsFFHKgrGV7vHJpDDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=I91Dtyrt; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2445806df50so63736905ad.1
        for <ksummit@lists.linux.dev>; Wed, 10 Sep 2025 12:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1757531527; x=1758136327; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgLbVMiPSinrJOJQ+wAE/rdDIsbkzBJnnk/llpZDwUQ=;
        b=I91DtyrtQnpTzbqD53B37J8pFcTqZh9PFU96SWNdnMYnNGiA2k+RbovxwiVFH55sm+
         nZLsSjD6EvHSfcYzMqDOr791Ge8cxJDZYTSvToQa6v8fj6H1tx4kH7W7M52N5mNZiFh3
         9FI0DKC0UhwFAxwsJQhGzNGn1YXJK/ugAhYNYnJElRj0Ifnw7OtzIQmYhXP1HGsQgMX2
         VlUCz9PGzG+HlKuacVkpJODDXNh4M//IXsusLga4GawV1cpiQDHjwEN3sf84PgD4hugk
         cSipYrzBpaPY7NbfBEWaQRJVn7m26mOEwRLa3I+q4eTTr9JnFQWAZbrIvqdKHsqCqBCI
         ObLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757531527; x=1758136327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgLbVMiPSinrJOJQ+wAE/rdDIsbkzBJnnk/llpZDwUQ=;
        b=gYOuEZBPgZILRulYF227iG4lzQacE++dUR5+agFmTLFk5lzKNw2nEyv6ndAS2sOMXe
         cHUQIdJTfQs33Eov8+JtLZfY4mdMnNklhMBf3uDJoJ0KaoOF78E0fJnyYmYjkUzcj5D3
         yDn6sP0D/o7xYagTY8+P7kGYQog7mRjdBweDU3i/Ed68zqT539h36YaJ4V4pc9AT5sHm
         s+g0g6JLh3onW8nTb85zxN7KlXioRyaYwLOXBfqFahO/hJImpobpfkbOHXcRcrYT3WHq
         Jl1AIlmd56hI1WsYkDHIl5fcelCvbbs3hZa3uyhCasxVA/uai+7Hga36ZE9LpEFNWnYQ
         uKbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU76c8aZIJ/V6SHN5AUPeVHHkXfr8jMxCo7RYA3caYJuWlPhxSY0/K1ZROXuq0ur+TInWUbfBsQ@lists.linux.dev
X-Gm-Message-State: AOJu0YzXQh70IIuCNHMoVCsK2AcyVAK6Fwl9+5usVBj4TzhGg6d9ykzx
	Y2VlLrqzTQjNMlnij74w/1XFOagVhdk8pc7F37kCHwjDB/n/rRgS24Oq9sR+8rAMLcNHuBF0sNW
	my2+lV8T3lhAwP5lUFXH+prrOVLuhjUPXDzfv+bc+
X-Gm-Gg: ASbGncs5h0EOQFLws10ByoYE1UWyehk2SuitcQnoeb+d9B0OCl04ZKceMGqUhqavx4R
	CBFEObdjI0KCNteR7oWB4cDViJB34wktKTtLxXi2Lc4g8sL+Lf3efbY7aOMBMfBbzkErbzj5ie6
	VFvlU92Qg9/etHBRNrIxoA7zvXC7SsOKMyl7oBYlEBgni96DM8VgxCzHPtp8I8DV594bYHDUmZO
	CPaj5fxusz4hqtE5A==
X-Google-Smtp-Source: AGHT+IEkFbxMIzXEsMxUl6A2vwa7uvOf7qiMuV8V/12m+O0jaREhkKbW4xhL91u6mZfYjvU9wkcdjdgUGuGSxO7BLx0=
X-Received: by 2002:a17:902:ce8b:b0:24a:d582:fbaa with SMTP id
 d9443c01a7336-2516f04ee0cmr250405645ad.12.1757531526965; Wed, 10 Sep 2025
 12:12:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <DC0B4305-C340-42C2-84B5-8C370794EBC2@fnnas.com>
 <ntzpuxiyoqf5a5ldeq4tlc37uy3nw3kojoes5ookdmcrb53ome@xbjcgntijlfl>
 <20250908113934.1a31423a@gandalf.local.home> <E5FD7630-3474-4F02-A4F8-A1C11DA7672A@fnnas.com>
 <4f2d4025-9fbf-441d-a51a-0c0d4ba16314@infradead.org> <CAHC9VhRyRuBtzwn2LbwxqLvj21LwrwrAZx4N3f7At1HHyNFPCQ@mail.gmail.com>
 <yiqw4rfqbry7s34af72eoemon2qbylc6prouafg7xx3aeo2uwa@tdgyedc43hhp>
In-Reply-To: <yiqw4rfqbry7s34af72eoemon2qbylc6prouafg7xx3aeo2uwa@tdgyedc43hhp>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 10 Sep 2025 15:11:55 -0400
X-Gm-Features: Ac12FXzB5zRWQkigskJaXBrIVSym6fvFtBD3LSg1T9V5ibIWwf1aLcn_oAoyZfs
Message-ID: <CAHC9VhR0RU+AfhJEZnA2=7CSZhWYTMB5CdbE9BfGoTbYBP9Rnw@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] re-think of richACLs in AI/LLM era
To: Coly Li <colyli@fnnas.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Jan Kara <jack@suse.cz>, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 9:32=E2=80=AFAM Coly Li <colyli@fnnas.com> wrote:
> On Mon, Sep 08, 2025 at 09:03:24PM +0800, Paul Moore wrote:

...

> > I can't say I'm familiar with the RichACL concept, but generally
> > speaking yes, the LSM framework exists as a way to implement access
> > control mechanisms beyond the traditional Linux access controls (other
> > things too, but those aren't really relevant here).
>
> Is it convenient for normal users or non-root processes (including the po=
licy agent) to
> setup the LSM rules? We need to allow normal users to set their own acces=
s control policy
> for the data they owned.

Management of an individual LSM's configuration is generally left to
the individual LSM.  Some LSMs restrict their configuration knobs
behind capabilities or their own access controls, while others allow
unprivileged access to the configuration; it depends on the LSM's
security model.  As an unprivileged example, Landlock allows
applications, run by arbitrary users, to set their own Landlock
security policy via the Landlock API.

> Also there is a special case, e.g. a file=E2=80=99s parent directory does=
n=E2=80=99t allow write
> permission, but the file needs to grant delete permission.
> 4614 int do_unlinkat(int dfd, struct filename *name)
> 4615 {
> [snipped]
> 4645                 inode =3D dentry->d_inode;
> 4646                 ihold(inode);
> 4647                 error =3D security_path_unlink(&path, dentry);
> 4648                 if (error)
> 4649                         goto exit3;
> 4650                 error =3D vfs_unlink(mnt_idmap(path.mnt), path.dentr=
y->d_inode,
> 4651                                    dentry, &delegated_inode);
> [snipped]
> 4563 int vfs_unlink(struct mnt_idmap *idmap, struct inode *dir,
> 4564                struct dentry *dentry, struct inode **delegated_inode=
)
> 4565 {
> 4566         struct inode *target =3D dentry->d_inode;
> 4567         int error =3D may_delete(idmap, dir, dentry, 0);
> 4568
> 4569         if (error)
> 4570                 return error;
> [snipped]
>
> It seems in do_unlinkat() the security check security_path_unlink() is ca=
lled before
> calling may_delete() inside vfs_unlink(). So even security rule permits t=
o delete
> this file but the parent directory doesn't grant write permission, such a=
ccess control
> still cannot be archieved.

One of the important parts of the LSM framework as a whole is that
LSMs can not grant access that would otherwise be blocked by the
standard/discretionary access controls built into the Linux kernel; in
other words, LSMs can only say "no" to an access, they can not grant
access by themselves.  Yes, this is by design, and no, I see no reason
to change that design decision at this point in time (doing so would
require a tremendous amount of work and likely introduce a fair number
of security regressions for quite some time).

--=20
paul-moore.com

